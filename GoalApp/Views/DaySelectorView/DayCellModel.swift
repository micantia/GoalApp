//
//  DayCellModel.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import Foundation

struct DayCellModel {
    let dayNumber: Int
    let isEnabled: Bool
    
    var stringValue: String {
         return "\(dayNumber)"
    }
}
