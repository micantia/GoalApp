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
    
    var availableDaysNumber: [DayCellModel] {
        guard let goalCreationDate = provider.userSettings.goalCreationDate,
              let goalDeadline = provider.userSettings.goalDeadline else { return [] }
        
        let calendar = Calendar.current
        let dayDifference = calendar.dateComponents([.day], from: goalCreationDate, to: goalDeadline).day ?? 1
        
        return (1...dayDifference).map { DayCellModel(dayNumber: $0, isEnabled: false) }
    }
}
