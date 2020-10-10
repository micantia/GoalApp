//
//  GoalViewController.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

class GoalViewController: UIViewController {

    lazy var titleView: BottomBorderedView = {
        let view = BottomBorderedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .defaultBackground
        view.borderWidth = 1
        view.borderColor = .borderBlue
        return view
    }()
    
    lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .avenirRegular(of: 30)
        label.textColor = .white
        label.text = "GOAL"
        return label
    }()
    
    lazy var daySelectorView: DaySelectorView = {
        let view = DaySelectorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dayInfoView: DayInfoView = {
        let view = DayInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func addSubviews() {
        view.addSubview(titleView)
        titleView.pinToEdges(top: 0, left: 0, bottom: nil, right: 0)
        titleView.constraintHeight(constant: 180)
        
        titleView.addSubview(appNameLabel)
        appNameLabel.center(X: 0, Y: -10)
        
        titleView.addSubview(daySelectorView)
        daySelectorView.pinToEdges(top: nil, left: 0, bottom: 0, right: 0)
        daySelectorView.constraintHeight(constant: 60)
        daySelectorView.setup(dayModels: (1...25).map { DayCellModel(dayNumber: $0, isEnabled: true) }, selectedIndex: 0)
        
        view.addSubview(dayInfoView)
        dayInfoView.constraint(topAnchor: titleView.bottomAnchor, constant: 0,
                               leftAnchor: view.leftAnchor, constant: 0,
                               bottomAnchor: view.bottomAnchor, constant: -(tabBarController?.tabBar.frame.height ?? 0),
                               rightAnchor: view.rightAnchor, constant: 0)
    }
    
}
