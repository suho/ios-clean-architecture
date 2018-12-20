//
//  SigninViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SafariServices

final class SigninViewController: ViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tokenTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    var viewModel: SigninViewModel!

    override func setupUI() {
        super.setupUI()
        navigationController?.isNavigationBarHidden = true
    }

    override func bindViewModel() {
        super.bindViewModel()
        let done = tokenTextField.rx.controlEvent(.editingDidEndOnExit).asObservable().emptyDriverIfError()
        let tokenText = tokenTextField.rx.text.orEmpty.asObservable().emptyDriverIfError()
        let webButton = button.rx.controlEvent(.touchUpInside).emptyDriverIfError()
        let input = SigninViewModel.Input(token: tokenText, done: done, webButton: webButton)
        let output = viewModel.transform(input: input)
        output.signin.drive().disposed(by: bag)
        output.error.drive().disposed(by: bag)
    }
}
