//
//  SplashNavigator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

protocol SplashCoordinate {
    func showSplash()
    func showHome()
}

final class SplashNavigator: Coordinate, SplashCoordinate {

    private let navigationController: UINavigationController

    @discardableResult
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showHome() {
        Application.shared.home()
    }

    func showSplash() {
        let controller = SplashViewController()
        let credentialUseCase = RealmProvider(configuration: SecurityRealm.configuration).credential()
        controller.viewModel = SplashViewModel(credentialUseCase: credentialUseCase, navigator: self)
        navigationController.pushViewController(controller, animated: true)
    }

    func showError(_ error: Error) {
        let alert = UIAlertController(title: App.String.appName,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        navigationController.present(alert, animated: true, completion: nil)
    }
}
