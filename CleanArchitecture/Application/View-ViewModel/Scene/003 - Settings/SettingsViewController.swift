//
//  SettingsViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class SettingsViewController: ViewController, View {

    var viewModel: SettingsViewModel!

    override func setupUI() {
        super.setupUI()
        title = App.String.history
    }
}
