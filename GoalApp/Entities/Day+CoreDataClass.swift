//
//  Day+CoreDataClass.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//
//

import Foundation
import CoreData

@objc(Day)
public class Day: NSManagedObject {

    enum DaySatisfactionKey: Int16 {
        case satisfied
        case notSatisfied
    }
    
    var satisfactionKey: DaySatisfactionKey {
        get {
            return DaySatisfactionKey(rawValue: satisfaction) ?? .satisfied
        }
        set {
            satisfaction = newValue.rawValue
        }
    }
    
}
