//
//  GoalViewModel.swift
//  GoalApp
//
//  Created by Micantia on 10/12/20.
//

import CoreData

final class GoalViewModel {
    let provider: CoreDataStackProvider
    
    init(provider: CoreDataStackProvider) {
        self.provider = provider
    }
    
    var currentDay: Day? {
        let request: NSFetchRequest<Day> = Day.fetchRequest()
        let currentDay = Calendar.current.startOfDay(for: Date())
        request.predicate = NSPredicate(format: "date == %@", currentDay as NSDate)
        let context = provider.coreData.persistanceContainer.viewContext
        return try? context.fetch(request).first
    }
}
