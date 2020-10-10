//
//  CoreDataStack.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import CoreData

final class CoreDataStack {
    
    lazy var persistanceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GoalApp")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistanceContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
}
