//
//  Date+dayDifference.swift
//  GoalApp
//
//  Created by Micantia on 10/13/20.
//

import Foundation

extension Date {
    
    func daysDifference(with date: Date) -> Int {
        let calendar = Calendar.current
        return (calendar.dateComponents([.day], from: date, to: self).day ?? 0)
    }
    
    func advancedByDays(value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: value, to: self) ?? self
    }
    
}
