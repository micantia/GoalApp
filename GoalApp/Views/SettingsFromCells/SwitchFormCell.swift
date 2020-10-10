//
//  SwitchFormCell.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

class SwitchFormCell: UITableViewCell {

    lazy var switchButton: CircleSwitchButton = {
        let button = CircleSwitchButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.borderWidth = 1
        button.borderColor = .grayDisabled
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .avenirRegular(of: 13)
        label.textColor = .darkGrayText
        label.text = "Placeholder text"
        return label
    }()
    
    var labelText: String? {
        didSet {
            label.text = labelText
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(switchButton)
        switchButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        switchButton.centerVerticaly()
        switchButton.constraintHeight(constant: 20)
        switchButton.equalHeightAndWidth()
        
        contentView.addSubview(label)
        label.constraint(topAnchor: nil, constant: nil,
                         leftAnchor: switchButton.rightAnchor, constant: 15,
                         bottomAnchor: nil, constant: nil,
                         rightAnchor: contentView.rightAnchor, constant: -20)
        label.centerVerticaly()
    }
    
}
