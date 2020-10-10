//
//  BottomBorderedView.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

class BottomBorderedView: UIView {
    
    let borderLayer: CALayer
    
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
    
    override init(frame: CGRect) {
        borderLayer = CALayer()
        borderLayer.borderWidth = 1
        super.init(frame: frame)
        
        layer.masksToBounds = false
        layer.addSublayer(borderLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        borderLayer.frame = CGRect(x: 0, y: frame.height - borderWidth, width: frame.width, height: borderWidth)
    }
    
}
