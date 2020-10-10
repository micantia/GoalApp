//
//  SettingsViewController.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

class SettingsViewController: UIViewController {

    lazy var titleView: BottomBorderedView = {
        let view = BottomBorderedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderWidth = 1
        view.borderColor = .borderBlue
        view.backgroundColor = .defaultBackground
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .avenirRegular(of: 30)
        label.textColor = .white
        label.text = "Settings"
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 180, left: 0, bottom: 0, right: 0)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var allowDailyNotificationCell: SwitchFormCell!
    var allowCalendarNotificationCell: SwitchFormCell!
    var goalTextViewCell: TextViewTableViewCell!
    var goalDeadLineDateCell: DateTableViewCell!
    var submitButtonCell: SubmitButtonTableViewCell!
    
    private let viewModel = SettingsViewModel(provider: AppServices.default)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupFormCells()
        addSubviews()
        hideKeyboardOnTap(#selector(hideKeyboard))
    }
    
    private func setupFormCells() {
        allowDailyNotificationCell = SwitchFormCell()
        allowDailyNotificationCell.labelText = "Allow daily notifications"
        
        allowCalendarNotificationCell = SwitchFormCell()
        allowCalendarNotificationCell.labelText = "Allow calendar notifications"
        
        goalTextViewCell = TextViewTableViewCell()
        goalTextViewCell.textViewPlaceholder = "Goal itself"
        goalTextViewCell.textViewText = viewModel.goal
        
        goalDeadLineDateCell = DateTableViewCell()
        goalDeadLineDateCell.placeholder = "Goal deadline"
        goalDeadLineDateCell.selectedDate = viewModel.goalDeadline
        
        submitButtonCell = SubmitButtonTableViewCell()
        submitButtonCell.buttonTitle = "Save changes"
        submitButtonCell.pressedAction = {
            self.submitChanges()
        }
    }
    
    private func addSubviews() {
        view.addSubview(titleView)
        titleView.pinToEdges(top: 0, left: 0, bottom: nil, right: 0)
        titleView.constraintHeight(constant: 180)
        
        titleView.addSubview(titleLabel)
        titleLabel.pinToEdges(top: nil, left: 20, bottom: -10, right: -20)
        
        view.insertSubview(tableView, at: 0)
        tableView.fillSuperview()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let safeAreaTop = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.safeAreaInsets.top ?? 0
        let offset = scrollView.contentOffset.y + safeAreaTop + 160

        let maxOffset: CGFloat = 100
        titleView.transform = .init(translationX: 0, y: min(0, max(-offset, -maxOffset)))
        
    }
    
    private func submitChanges() {
        guard let goal = goalTextViewCell.textValue,
              let goalDeadline = goalDeadLineDateCell.selectedDate else { return }
        viewModel.saveChanges(goal: goal, goalDeadline: goalDeadline) {
            print("changes saved")
        }
    }
}
