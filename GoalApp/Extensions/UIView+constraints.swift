//
//  UIView+constraints.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

extension UIView {
    func fillSuperview() {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leftAnchor.constraint(equalTo: superview.leftAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            rightAnchor.constraint(equalTo: superview.rightAnchor)
        ])
    }
    
    func pinToEdges(top: CGFloat?, left: CGFloat?, bottom: CGFloat?, right: CGFloat?) {
        guard let superview = superview else { return }
        
        if let top = top {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: right).isActive = true
        }
    }
    
    func constraintHeight(constant height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func constraintWidth(constant width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func center(X: CGFloat = 0, Y: CGFloat = 0) {
        guard let superview = superview else { return }
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: X).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: Y).isActive = true
    }
    
    func centerVerticaly(Y: CGFloat = 0) {
        guard let superview = superview else { return }
        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: Y).isActive = true
    }
    
    func centerHorizontaly(X: CGFloat = 0) {
        guard let superview = superview else { return }
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: X).isActive = true
    }
    
    func equalHeightAndWidth(constant height: CGFloat = 0) {
        widthAnchor.constraint(equalTo: heightAnchor, constant: height).isActive = true
    }
    
    func constraint(topAnchor: NSLayoutYAxisAnchor?, constant top: CGFloat?,
                    leftAnchor: NSLayoutXAxisAnchor?, constant left: CGFloat?,
                    bottomAnchor: NSLayoutYAxisAnchor?, constant bottom: CGFloat?,
                    rightAnchor: NSLayoutXAxisAnchor?, constant right: CGFloat?) {
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: top ?? 0).isActive = true
        }
        
        if let leftAnchor = leftAnchor {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: left ?? 0).isActive = true
        }
        
        if let bottomAnchor = bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom ?? 0).isActive = true
        }
        
        if let rightAnchor = rightAnchor {
            self.rightAnchor.constraint(equalTo: rightAnchor, constant: right ?? 0).isActive = true
        }
        
    }
}
