//
//  DayInfoContentView.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import UIKit

class DayInfoContentView: UIView {

    lazy var dayStateBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    lazy var goalTextView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Day 6.\nIm half a way to my dream. Ive done pretty much for 6 days. But its still hard for me. I beleive in myself. No matter how its hard i still follow my way. Its my ninja way. But i think i need one day off. Tommorow i plan to clean my mind and go meet friends in pub. Drink beer and just chill. "
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var placeholderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var addNoteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Note", for: .normal)
        button.setTitleColor(.borderBlue, for: .normal)
        button.titleLabel?.font = .avenirRegular(of: 14)
        return button
    }()
    
    lazy var emptyNoteText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .avenirRegular(of: 14)
        label.numberOfLines = 0
        label.text = "Nothing were done this day\n But if im wrong"
        label.textAlignment = .center
        return label
    }()
    
    weak var delegate: DayInfoViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(dayStateBorder)
        dayStateBorder.constraintWidth(constant: 5)
        dayStateBorder.pinToEdges(top: 20, left: 15, bottom: -20, right: nil)
        
        addSubview(goalTextView)
        goalTextView.constraint(topAnchor: topAnchor, constant: 15,
                                leftAnchor: dayStateBorder.rightAnchor, constant: 15,
                                bottomAnchor: bottomAnchor, constant: -20,
                                rightAnchor: rightAnchor, constant: -15)
        
        addSubview(placeholderView)
        placeholderView.fillSuperview()
        placeholderView.center()
        
        placeholderView.addSubview(emptyNoteText)
        emptyNoteText.center(X: 0, Y: -50)
        
        placeholderView.addSubview(addNoteButton)
        addNoteButton.centerHorizontaly()
        addNoteButton.constraintHeight(constant: 40)
        addNoteButton.topAnchor.constraint(equalTo: emptyNoteText.bottomAnchor, constant: 10).isActive = true
        addNoteButton.addTarget(self, action: #selector(toAddDayNoteSegue), for: .touchUpInside)
    }
    
    func setup(with model: Day?) {
        guard let model = model else {
            hideNeededSubviews(true)
            return
        }
        goalTextView.text = model.note
        hideNeededSubviews(false)
    }

    private func hideNeededSubviews(_ shouldHide: Bool) {
        dayStateBorder.isHidden = shouldHide
        goalTextView.isHidden = shouldHide
        placeholderView.isHidden = !shouldHide
    }
    
    @objc private func toAddDayNoteSegue() {
        delegate?.performSegueToAddDayNote()
    }
   
}
