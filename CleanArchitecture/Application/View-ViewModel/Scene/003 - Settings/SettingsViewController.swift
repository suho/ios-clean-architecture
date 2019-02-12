//
//  SettingsViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit
import SafariServices
import Firebase

final class SettingsViewController: ViewController, View {

    var viewModel: SettingsViewModel!

    override func setupUI() {
        super.setupUI()
        title = App.String.settings
        if let url = URL(string: "https://github.com/login/oauth/authorize?client_id=49730bf0294929517d82") {
            let controller = SFSafariViewController(url: url)
            tabBarController?.present(controller, animated: true, completion: nil)
        }
    }
}

// MARK: - SFSafariViewControllerDelegate
extension SettingsViewController: SFSafariViewControllerDelegate {
}
