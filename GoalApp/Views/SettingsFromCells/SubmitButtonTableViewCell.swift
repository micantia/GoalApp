//
//  SubmitButtonTableViewCell.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import UIKit

class SubmitButtonTableViewCell: UITableViewCell {
    
    var buttonTitle: String? {
        didSet {
            submitButton.setTitle(buttonTitle, for: .normal)
        }
    }
    
    var pressedAction: (() -> Void)?
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .defaultBackground
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .avenirRegular(of: 14)
        button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
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
        contentView.addSubview(submitButton)
        submitButton.fillSuperview()
    }
    
    @objc private func onButtonPressed(_ sender: UIButton) {
        pressedAction?()
    }
}
