//
//  UIFont+Avenir.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

extension UIFont {
    static func avenirRegular(of size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func avenirBold(of size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
    }
}
