//
//  NavigationController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
        }
        navigationBar.barStyle = .black
        navigationBar.tintColor = App.Theme.current.package.tabbarTint
    }
}
