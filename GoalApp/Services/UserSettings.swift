//
//  UserSettings.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import Foundation

final class UserSettings {
    
    enum UserSettingsKey: String {
        case goal
        case goalCreationDate
        case goalDeadline
        case calendarNotificationsEnabled
        case dailyNotificationsEnabled
    }
    
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    var goal: String? {
        get {
            return userDefaults.value(forKey: .goal) as? String
        }
        set {
            userDefaults.set(newValue, forKey: .goal)
        }
    }
    
    var goalDeadline: Date? {
        get {
            return userDefaults.value(forKey: .goalDeadline) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: .goalDeadline)
        }
    }
    
    var goalCreationDate: Date? {
        get {
            return userDefaults.value(forKey: .goalCreationDate) as? Date
        }
        set {
            userDefaults.set(newValue, forKey: .goalCreationDate)
        }
    }
    
    var calendarNotificationsEnabled: Bool? {
        return userDefaults.value(forKey: .calendarNotificationsEnabled) as? Bool
    }
    
    var dailyNotificationsEnabled: Bool? {
        return userDefaults.value(forKey: .dailyNotificationsEnabled) as? Bool
    }
    
}

extension UserDefaults {
    func value(forKey key: UserSettings.UserSettingsKey) -> Any? {
        return value(forKey: key.rawValue)
    }
    
    func set(_ value: Any?, forKey key: UserSettings.UserSettingsKey) {
        setValue(value, forKey: key.rawValue)
    }
}
