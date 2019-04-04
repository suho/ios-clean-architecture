//
//  TabBarController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/15/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController, View {

    var viewModel: TabBarViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        tabBar.barStyle = .black
        tabBar.tintColor = App.Theme.current.package.tabbarTint
    }
}
