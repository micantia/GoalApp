//
//  SettingsViewController+TableViewForm.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return 150
            case 1:
                return 50
            default:
                return 0
            }
        case 1:
            return 40
        case 2:
            return 60
        default:
            return 0
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Goal Info"
        case 1:
            return "Notifications"
        default:
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return goalTextViewCell
            case 1:
                return goalDeadLineDateCell
            default:
                return UITableViewCell()
            }
        case 1:
            switch indexPath.row {
            case 0:
                return allowDailyNotificationCell
            case 1:
                return allowCalendarNotificationCell
            default:
                return UITableViewCell()
            }
        case 2:
            switch indexPath.row {
            case 0:
                return submitButtonCell
            default:
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
}
