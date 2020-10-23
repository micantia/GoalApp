//
//  DayInfoHeaderView.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import UIKit

class DayInfoHeaderView: UIView {

    let provider: UserSettingsProvider = AppServices.default
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .avenirBold(of: 22)
        label.text = "Day 1"
        label.textColor = .white
        return label
    }()
    
    lazy var deadlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = .avenirRegular(of: 12)
        label.textColor = .veryLightGray
        label.text = "10.08.2020\n- 234 days until deadline"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(dayLabel)
        dayLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 13).isActive = true
        dayLabel.centerVerticaly()
        
        addSubview(deadlineLabel)
        deadlineLabel.centerVerticaly()
        deadlineLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -13).isActive = true
    }
    
    func setup(dayNumber: Int) {
        dayLabel.text = "Day \(dayNumber)"
        
        guard let goalDeadline = provider.userSettings.goalDeadline,
              let goalCreationDate = provider.userSettings.goalCreationDate else { return }
        let date = goalCreationDate.advancedByDays(value: dayNumber - 1)
        
        let daysDifference = goalDeadline.daysDifference(with: date)
        let dateString = DateFormatter.dateString(from: date)
        
        deadlineLabel.text = dateString + "\n\(daysDifference) days until deadline"
        
    }
    
}
