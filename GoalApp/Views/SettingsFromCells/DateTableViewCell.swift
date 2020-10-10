//
//  TextFieldTableViewCell.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    var selectedDate: Date? {
        didSet {
            textField.text = DateFormatter.fullDateString(from: selectedDate ?? Date())
        }
    }
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .avenirRegular(of: 12)
        return textField
    }()
    
    lazy var triggerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(textField)
        textField.pinToEdges(top: 0, left: 16, bottom: 0, right: 0)
        
        contentView.addSubview(triggerButton)
        triggerButton.fillSuperview()
    }
    
    @objc private func showDatePicker() {
        DatePickerLauncher.presentDatePicker(startDate: Date(), endDate: nil, selectedDate: selectedDate, pickerMode: .dateAndTime) { (date) in
            guard let date = date else { return }
            self.selectedDate = date
        }
    }

}
