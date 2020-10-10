//
//  DayCollectionViewCell.swift
//  GoalApp
//
//  Created by Micantia on 10/9/20.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell, Reusable {
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? .darkGreen : .clear
        }
    }
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .avenirRegular(of: 14)
        label.textColor = .grayDisabled
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(dayLabel)
        dayLabel.center()
    }
    
    func setup(with dayModel: DayCellModel) {
        dayLabel.text = dayModel.stringValue
        dayLabel.textColor = dayModel.isEnabled ? .white : .grayDisabled
    }
    
}
