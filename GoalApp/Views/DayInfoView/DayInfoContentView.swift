//
//  DayInfoContentView.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import UIKit

class DayInfoContentView: UIView {

    lazy var dayStateBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    lazy var goalTextView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Day 6.\nIm half a way to my dream. Ive done pretty much for 6 days. But its still hard for me. I beleive in myself. No matter how its hard i still follow my way. Its my ninja way. But i think i need one day off. Tommorow i plan to clean my mind and go meet friends in pub. Drink beer and just chill. "
        view.isUserInteractionEnabled = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(dayStateBorder)
        dayStateBorder.constraintWidth(constant: 5)
        dayStateBorder.pinToEdges(top: 20, left: 15, bottom: -20, right: nil)
        
        addSubview(goalTextView)
        goalTextView.constraint(topAnchor: topAnchor, constant: 15,
                                leftAnchor: dayStateBorder.rightAnchor, constant: 15,
                                bottomAnchor: bottomAnchor, constant: -20,
                                rightAnchor: rightAnchor, constant: -15)
    }
   
}
