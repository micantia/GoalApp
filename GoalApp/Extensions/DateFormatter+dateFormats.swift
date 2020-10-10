//
//  DateFormatter+dateFormats.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import Foundation

extension DateFormatter {
    static func fullDateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy hh:mm"
        return dateFormatter.string(from: date)
    }
}
