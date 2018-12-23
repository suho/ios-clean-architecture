//
//  MeNavigator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

protocol MeCoordinate {
    func showProfile()
}

final class MeNavigator: ErrorCoordinate, MeCoordinate {

    private let navigationController: UINavigationController

    @discardableResult
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showProfile() {
        let controller = MeViewController()
        let viewModel = MeViewModel(navigator: self,
                                    networkService: NetworkProvider.current.user(),
                                    realmService: RealmProvider.standard.user())
        controller.viewModel = viewModel
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
