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
        view.delegate = self
        return view
    }()
    
    private let viewModel = GoalViewModel(provider: AppServices.default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        dayInfoView.setup(with: viewModel.currentDay, dayNumber: viewModel.currentDayNumber)
        daySelectorView.setup(dayModels: viewModel.availableDaysNumber,
                              selectedIndex: viewModel.currentDayNumber)
        daySelectorView.onDaySelected = { dayNumber in
            self.dayInfoView.setup(with: self.viewModel.day(for: dayNumber), dayNumber: dayNumber)
        }
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
        
        view.addSubview(dayInfoView)
        dayInfoView.constraint(topAnchor: titleView.bottomAnchor, constant: 0,
                               leftAnchor: view.leftAnchor, constant: 0,
                               bottomAnchor: view.bottomAnchor, constant: -(tabBarController?.tabBar.frame.height ?? 0),
                               rightAnchor: view.rightAnchor, constant: 0)
    }
    
}

extension GoalViewController: DayInfoViewDelegate {
    func performSegueToAddDayNote() {
        let controller = AddDayNoteViewController()
        controller.delegate = self
        controller.dateAdding = viewModel.goalCreationDate?.advancedByDays(value: (daySelectorView.selectedDayNumber ?? 1) - 1)
        let embededController = UINavigationController(rootViewController: controller)
        present(embededController, animated: true, completion: nil)
    }
}

extension GoalViewController: AddDayNoteControllerDelegate {
    func onNewDayNoteAdded(_ day: Day) {
        dayInfoView.dayInfoContentView.setup(with: day)
    }
}
