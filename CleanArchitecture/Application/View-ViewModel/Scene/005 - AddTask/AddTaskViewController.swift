//
//  AddTaskViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 2/2/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class AddTaskViewController: ViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    weak var cancelButton: UIBarButtonItem!
    weak var saveButton: UIBarButtonItem!

    var viewModel: AddTaskViewModel!

    override func setupUI() {
        super.setupUI()
        setupBackground()
        setupNavi()
        setupTimePicker()
        setupTextField()
    }

    override func bindViewModel() {
        super.bindViewModel()
        let cancel = cancelButton.rx.tap.emptyDriverIfError()
        let input = AddTaskViewModel.Input(cancelTrigger: cancel)
        let output = viewModel.transform(input: input)
        output.cancel.drive().disposed(by: bag)
    }
}

// MARK: - UI
extension AddTaskViewController {
    private func setupBackground() {
        view.backgroundColor = App.Theme.current.package.viewBackground
    }

    private func setupNavi() {
        title = "Add Task Today"
        navi?.isProgressHidden = true
        navi?.navigationBar.prefersLargeTitles = false
        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        cancelButton = leftButton
        let rightButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        saveButton = rightButton
    }

    private func setupTimePicker() {
        timePicker.minimumDate = Date()
        timePicker.setValue(UIColor.white, forKey: "textColor")
    }

    private func setupTextField() {
        nameTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension AddTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
