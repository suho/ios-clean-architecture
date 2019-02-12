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

    weak var cancelButton: UIBarButtonItem!
    weak var saveButton: UIBarButtonItem!

    override func setupUI() {
        super.setupUI()
        setupBackground()
        setupNavi()
    }

    override func bindViewModel() {
        super.bindViewModel()
        cancelButton.rx.tap.asDriver().drive(onNext: { _ in
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: bag)
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
}
