//
//  TextViewTableViewCell.swift
//  GoalApp
//
//  Created by Micantia on 10/10/20.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
    
    var textViewPlaceholder: String? {
        didSet {
            textView.text = textViewPlaceholder
        }
    }
    
    var textViewText: String? {
        didSet {
            textView.text = textViewText
            textView.textColor = .black
        }
    }
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        textView.textColor = .lightGray
        textView.font = .avenirRegular(of: 12)
        textView.textContainerInset = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        return textView
    }()
    
    var textValue: String? {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(textView)
        textView.fillSuperview()
    }
    
}

extension TextViewTableViewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = textViewPlaceholder
            textView.textColor = .lightGray
        }
    }
}
