//
//  CircleSwitchButton.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

class CircleSwitchButton: UIButton {
    
    var isOn: Bool = false
    
    var borderColor: UIColor = .black {
        didSet {
            borderLayer.borderColor = borderColor.cgColor
        }
    }
    
    var borderWidth: CGFloat = 1 {
        didSet {
            borderLayer.borderWidth = borderWidth
            layoutSubviews()
        }
    }
    
    let borderLayer: CALayer
    
    override init(frame: CGRect) {
        borderLayer = CALayer()
        super.init(frame: frame)
        layer.cornerRadius = frame.height / 2
        borderLayer.borderWidth = borderWidth
        borderLayer.borderColor = borderColor.cgColor
        layer.addSublayer(borderLayer)
        addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        borderLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        borderLayer.cornerRadius = borderLayer.frame.height / 2
    }
    
    @objc private func toggleButton() {
        isOn.toggle()
        backgroundColor = isOn ? .defaultBackground : .clear
        borderLayer.borderColor = isOn ? UIColor.defaultBackground.cgColor : borderColor.cgColor
    }

}
