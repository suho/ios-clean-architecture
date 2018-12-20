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

final class MeNavigator: Coordinate, MeCoordinate {

    private let navigationController: UINavigationController

    @discardableResult
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showProfile() {
        let controller = MeViewController()
        controller.viewModel = MeViewModel(navigator: self, userUseCase: NetworkProvider.current.user())
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
