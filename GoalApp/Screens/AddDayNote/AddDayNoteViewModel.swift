//
//  AddDayNoteViewModel.swift
//  GoalApp
//
//  Created by Micantia on 10/14/20.
//

import Foundation

struct AddDayNoteViewModel {
    let provider: CoreDataStackProvider
    
    func saveDayNote(note: String, date: Date, completion: @escaping (Day) -> Void) {
        let context = provider.coreData.persistanceContainer.viewContext
        let dayNote = Day(context: context)
        let date = Calendar.current.startOfDay(for: date)
        dayNote.date = date
        dayNote.note = note
        
        provider.coreData.saveContext()
        
        completion(dayNote)
    }
}
