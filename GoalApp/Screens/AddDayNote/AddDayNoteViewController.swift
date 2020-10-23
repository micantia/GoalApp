//
//  AddDayNoteViewController.swift
//  GoalApp
//
//  Created by Micantia on 10/12/20.
//

import UIKit

protocol AddDayNoteControllerDelegate: class {
    func onNewDayNoteAdded(_ day: Day)
}

class AddDayNoteViewController: UIViewController {

    lazy var saveButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Add"
        button.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.avenirBold(of: 14)], for: .normal)
        button.action = #selector(saveDayNote)
        button.target = self
        return button
    }()
    
    lazy var cancelButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Cancel"
        button.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.avenirRegular(of: 14)], for: .normal)
        button.action = #selector(cancelVC)
        button.target = self
        return button
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let viewModel = AddDayNoteViewModel(provider: AppServices.default)
    weak var delegate: AddDayNoteControllerDelegate?
    var dateAdding: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add day note"
        navigationItem.rightBarButtonItem = saveButtonItem
        navigationItem.leftBarButtonItem = cancelButtonItem
        navigationController?.navigationBar.tintColor = .darkGreen
        
        view.addSubview(textView)
        textView.fillSuperview()
        textView.becomeFirstResponder()
    }
    
    @objc private func saveDayNote() {
        guard let text = textView.text,
              let date = dateAdding else { return }
        viewModel.saveDayNote(note: text, date: date) { (day) in
            self.delegate?.onNewDayNoteAdded(day)
            self.cancelVC()
        }
    }
    
    @objc private func cancelVC() {
        dismiss(animated: true, completion: nil)
    }

}
