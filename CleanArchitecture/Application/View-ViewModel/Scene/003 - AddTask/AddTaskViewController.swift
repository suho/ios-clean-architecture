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
    }

    override func bindViewModel() {
        super.bindViewModel()
        let save = saveButton.rx.tap
            .do(onNext: { _ in
                self.view.endEditing(true)
            })
            .emptyDriverIfError()
        let cancel = cancelButton.rx.tap.asDriver()
        let time = timePicker.rx.date.asDriver()
        let name = nameTextField.rx.text.orEmpty.asDriver()
        let input = AddTaskViewModel.Input(cancelTrigger: cancel, saveTrigger: save, time: time, name: name)
        let output = viewModel.transform(input: input)
        output.cancel.drive().disposed(by: bag)
        output.save.drive().disposed(by: bag)
        nameTextField.rx.controlEvent(.editingDidEndOnExit)
            .do(onNext: { _ in
                self.view.endEditing(true)
            })
            .emptyDriverIfError()
            .drive()
            .disposed(by: bag)
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
}
