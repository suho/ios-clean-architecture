//
//  HistoryViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class HistoryViewController: ViewController, View {

    var viewModel: HistoryViewModel!

    override func setupUI() {
        super.setupUI()
        title = App.String.history
    }
}
