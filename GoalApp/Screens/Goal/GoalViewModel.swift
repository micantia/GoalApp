//
//  GoalViewModel.swift
//  GoalApp
//
//  Created by Micantia on 10/12/20.
//

import CoreData

final class GoalViewModel {
    let provider: CoreDataStackProvider & UserSettingsProvider
    
    init(provider: CoreDataStackProvider & UserSettingsProvider) {
        self.provider = provider
    }
    
    var currentDay: Day? {
        let request: NSFetchRequest<Day> = Day.fetchRequest()
        let currentDay = Calendar.current.startOfDay(for: Date())
        request.predicate = NSPredicate(format: "date == %@", currentDay as NSDate)
        let context = provider.coreData.persistanceContainer.viewContext
        return try? context.fetch(request).first
    }
    
    func day(for dayNumber: Int) -> Day? {
        guard let goalCreationDate = provider.userSettings.goalCreationDate else { return nil }
        let startOfGoalCreationDate = Calendar.current.startOfDay(for: goalCreationDate)
        let dateForDayNumber = startOfGoalCreationDate.advancedByDays(value: dayNumber - 1)
        
        let request: NSFetchRequest<Day> = Day.fetchRequest()
        request.predicate = NSPredicate(format: "date == %@", dateForDayNumber as NSDate)
        let context = provider.coreData.persistanceContainer.viewContext
        
        return try? context.fetch(request).first
    }
    
    var goalCreationDate: Date? {
        return provider.userSettings.goalCreationDate
    }
    
    var currentDayNumber: Int {
        guard let goalCreationDate = provider.userSettings.goalCreationDate else { return 1 }
        return Date().daysDifference(with: goalCreationDate) + 1
    }
    
    var availableDaysNumber: [DayCellModel] {
        guard let goalCreationDate = provider.userSettings.goalCreationDate,
              let goalDeadline = provider.userSettings.goalDeadline else { return [] }
        
        let dayDifference = goalDeadline.daysDifference(with: goalCreationDate) + 1
        
        return (1...dayDifference).map { DayCellModel(dayNumber: $0, isEnabled: self.isDayDisabled(at: $0)) }
    }
    
    func isDayDisabled(at number: Int) -> Bool {
        guard let goalCreationDate = provider.userSettings.goalCreationDate else { return false }
        let date = goalCreationDate.advancedByDays(value: number - 1)
        return date <= Date()
    }
}
