//
//  SettingsViewModel.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import Foundation

struct SettingsViewModel {
    let provider: UserSettingsProvider
    
    var goalDeadline: Date? {
        return provider.userSettings.goalDeadline
    }
    
    var goal: String? {
        return provider.userSettings.goal
    }
    
    func saveChanges(goal: String, goalDeadline: Date, completion: @escaping () -> Void) {
        provider.userSettings.goal = goal
        provider.userSettings.goalDeadline = goalDeadline
        completion()
    }
}
