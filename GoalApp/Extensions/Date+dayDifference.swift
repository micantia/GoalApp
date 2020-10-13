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
        return calendar.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
}
