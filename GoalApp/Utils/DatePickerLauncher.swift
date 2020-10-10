//
//  DatePickerLauncher.swift
//  SuccessfulPregnancy
//
//  Created by Micantia on 9/25/20.
//  Copyright © 2020 Valeria. All rights reserved.
//

import UIKit

class DatePickerLauncher {
    
    static var currentView: UIView? {
        if #available(iOS 13, *) {
            return UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    static func presentDatePicker(startDate: Date?, endDate: Date?, selectedDate: Date?, pickerMode: UIDatePicker.Mode, completion: @escaping (Date?) -> Void) {
        guard let currentView = DatePickerLauncher.currentView else { return }
        let view = BigDatePickerView(startDate: startDate,
                                     endDate: endDate,
                                     selectedDate: selectedDate,
                                     pickerMode: pickerMode,
                                     completion: completion)
        view.translatesAutoresizingMaskIntoConstraints = false
        currentView.addSubview(view)
        view.fillSuperview()
    }
    
    static func presentDatePicker(selectedDate: Date, pickerMode: UIDatePicker.Mode, completion: @escaping (Date?) -> Void) {
        guard let currentView = DatePickerLauncher.currentView else { return }
        let view = BigDatePickerView(selectedDate: selectedDate, pickerMode: pickerMode, completion: completion)
        view.translatesAutoresizingMaskIntoConstraints = false
        currentView.addSubview(view)
        view.fillSuperview()
    }
    
}
