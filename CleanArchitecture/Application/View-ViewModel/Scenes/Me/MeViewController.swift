//
//  MeViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

final class MeViewController: ViewController {

    var viewModel: MeViewModel!

    override func setupUI() {
        super.setupUI()
        title = "Profile"
    }
}
