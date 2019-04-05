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
        title = App.String.settings
//        guard var components = URLComponents(string: UserNetwork.authURL) else { return }
//        let queryItems: [URLQueryItem] = [URLQueryItem(name: App.Key.Github.clientIdKey, value: App.Key.Github.clientIdValue)]
//        components.queryItems = queryItems
//        if let url = components.url {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
    }
}
