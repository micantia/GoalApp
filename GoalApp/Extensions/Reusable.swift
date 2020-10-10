//
//  Reusable.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self) + "Identifier"
    }
}
