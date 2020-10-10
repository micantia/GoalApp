//
//  Day+CoreDataProperties.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var note: String?
    @NSManaged public var date: Date?
    @NSManaged public var satisfaction: Int16

}

extension Day : Identifiable {

}
