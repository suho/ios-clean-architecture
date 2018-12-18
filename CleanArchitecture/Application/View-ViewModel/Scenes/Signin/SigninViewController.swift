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
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    var viewModel: SigninViewModel!

    override func setupUI() {
        super.setupUI()
        navigationController?.isNavigationBarHidden = true
    }

    override func bindViewModel() {
        super.bindViewModel()
        let done = textField.rx.controlEvent(.editingDidEndOnExit).flatMapLatest { _ in
            return self.textField.rx.text.orEmpty
        }.asObservable()
        let text = textField.rx.text.orEmpty.asObservable()
        let trigger = done.withLatestFrom(text)
        let input = SigninViewModel.Input(trigger: trigger)
        let output = viewModel.transform(input: input)
        output.user.asObservable().subscribe { (event) in
            switch event {
            case .next(let user):
                print(user.uid)
            default: break
            }
        }.disposed(by: bag)
    }
}
