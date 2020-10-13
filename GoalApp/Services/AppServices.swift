//
//  AppServices.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import Foundation

protocol UserSettingsProvider {
    var userSettings: UserSettings { get }
}

protocol CoreDataStackProvider {
    var coreData: CoreDataStack { get }
}

protocol AppServicesProvider: UserSettingsProvider, CoreDataStackProvider {
    
}

final class AppServices: AppServicesProvider {
    
    static let `default` = AppServices()
    
    let userSettingsProvider: UserSettings
    let coreDataStackProvider: CoreDataStack
    
    var userSettings: UserSettings {
        return userSettingsProvider
    }
    
    var coreData: CoreDataStack {
        return coreDataStackProvider
    }
    
    private init() {
        self.userSettingsProvider = UserSettings(userDefaults: .standard)
        self.coreDataStackProvider = CoreDataStack()
    }
    
}
