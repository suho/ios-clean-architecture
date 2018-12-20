//
//  SplashViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

final class SplashViewController: ViewController {

    var viewModel: SplashViewModel!

    override func bindViewModel() {
        super.bindViewModel()
        let output = viewModel.transform(input: SplashViewModel.Input())
        output.credential.drive().disposed(by: bag)
    }
}
