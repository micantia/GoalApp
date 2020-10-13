//
//  DayInfoView.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import UIKit

class DayInfoView: UIView {

    lazy var dayInfoHeaderView: DayInfoHeaderView = {
        let view = DayInfoHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkerbackground
        return view
    }()
    
    lazy var dayInfoContentView: DayInfoContentView = {
        let view = DayInfoContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    weak var delegate: DayInfoViewDelegate? {
        didSet {
            dayInfoContentView.delegate = delegate
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(dayInfoHeaderView)
        dayInfoHeaderView.pinToEdges(top: 0, left: 0, bottom: nil, right: 0)
        dayInfoHeaderView.constraintHeight(constant: 60)
        
        addSubview(dayInfoContentView)
        dayInfoContentView.constraint(topAnchor: dayInfoHeaderView.bottomAnchor, constant: 0,
                                      leftAnchor: leftAnchor, constant: 0,
                                      bottomAnchor: bottomAnchor, constant: 0,
                                      rightAnchor: rightAnchor, constant: 0)
    }
    
    func setup(with model: Day?) {
        dayInfoContentView.setup(with: model)
    }
    
}
