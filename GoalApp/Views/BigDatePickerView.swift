//
//  BigDatePickerView.swift
//  SuccessfulPregnancy
//
//  Created by Micantia on 9/25/20.
//  Copyright © 2020 Valeria. All rights reserved.
//

import UIKit

class BigDatePickerView: UIView {
    
    private var isPresented: Bool = false
    private var startDate: Date?
    private var endDate: Date?
    private var selectedDate: Date?
    private var pickerMode: UIDatePicker.Mode
    private var completion: (Date?) -> Void
    
    private var bgView: UIVisualEffectView = {
        let visualEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: visualEffect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.isUserInteractionEnabled = true
        return effectView
    }()
    
    private var picker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 14, *) {
            picker.preferredDatePickerStyle = .inline
        }
        picker.tintColor = .darkGreen
        return picker
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .avenirRegular(of: 14)
        button.setTitleColor(.darkGreen, for: .normal)
        button.addTarget(self, action: #selector(animateRemoval), for: .touchUpInside)
        return button
    }()
    
    private var okButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.darkGreen, for: .normal)
        button.titleLabel?.font = .avenirBold(of: 14)
        button.setTitle("OK", for: .normal)
        button.addTarget(self, action: #selector(completeAnimated), for: .touchUpInside)
        return button
    }()
    
    private var animationDuration = 0.3
    
    private var allObjects: [UIView] {
        return [self, cancelButton, okButton, picker, bgView]
    }
    
    init(startDate: Date?, endDate: Date?, selectedDate: Date?, pickerMode: UIDatePicker.Mode, completion: @escaping (Date?) -> Void) {
        self.startDate = startDate
        self.endDate = endDate
        self.pickerMode = pickerMode
        self.selectedDate = selectedDate
        self.completion = completion
        super.init(frame: .zero)
        addKeyboardObservers()
        presentDatePicker()
    }
    
    init(selectedDate: Date, pickerMode: UIDatePicker.Mode, completion: @escaping (Date?) -> Void) {
        self.selectedDate = selectedDate
        self.pickerMode = pickerMode
        self.completion = completion
        super.init(frame: .zero)
        addKeyboardObservers()
        presentDatePicker()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentDatePicker() {
        addSubview(bgView)
        bgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        addHideGestureRecognizer(to: bgView)
        
        setupPicker()
        
        addSubview(picker)
        picker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        picker.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        picker.heightAnchor.constraint(equalTo: picker.widthAnchor, multiplier: 1).isActive = true
        
        addSubview(okButton)
        okButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        okButton.bottomAnchor.constraint(equalTo: picker.topAnchor, constant: -10).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        okButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(cancelButton)
        cancelButton.trailingAnchor.constraint(equalTo: okButton.leadingAnchor, constant: 0).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: picker.topAnchor, constant: -10).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        animatePicker()
    }
    
    private func setupPicker() {
        if startDate != nil && endDate != nil {
            picker.minimumDate = startDate
            picker.maximumDate = endDate
        }
        picker.date = selectedDate ?? Date()
        picker.datePickerMode = pickerMode
    }
    
    private func addHideGestureRecognizer(to view: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(animateRemoval))
        tap.cancelsTouchesInView = false
        print("dasd")
        view.addGestureRecognizer(tap)
    }
    
    @objc private func animateRemoval() {
        animatePicker()
    }
    
    @objc private func completeAnimated() {
        animatePicker()
        completion(picker.date)
    }
    
    @objc private func removeView() {
        allObjects.forEach { $0.removeFromSuperview() }
    }
    
    private func animatePicker() {
        if isPresented == false {
            allObjects.forEach { $0.alpha = 0 }
            UIView.animate(withDuration: animationDuration) {
                self.allObjects.forEach { $0.alpha = 1 }
            }
        } else {
            allObjects.forEach { $0.alpha = 1 }
            UIView.animate(withDuration: animationDuration) {
                self.allObjects.forEach { $0.alpha = 0 }
            } completion: { _ in
                self.removeView()
            }
        }
        isPresented = !isPresented
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let heightUnderPicker = (UIScreen.main.bounds.height - picker.frame.height) / 2
            let offset = heightUnderPicker > keyboardSize.height ? 0 : keyboardSize.height - heightUnderPicker
            self.transform = CGAffineTransform(translationX: 0, y: -offset)
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        self.transform = CGAffineTransform(translationX: 0, y: 0)
    }
}
