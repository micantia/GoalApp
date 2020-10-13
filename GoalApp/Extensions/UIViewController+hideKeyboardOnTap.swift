//
//  UIViewController+hideKeyboardOnTap.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import UIKit

extension UIViewController {
    func hideKeyboardOnTap(_ selector: Selector) {
        let tap = UITapGestureRecognizer(target: self, action: selector)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
