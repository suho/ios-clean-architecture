//
//  AuthNavigator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

protocol AuthCoordinate {
    func showSignin()
}

final class AuthNavigator: AuthCoordinate {

    private let navigationController: UINavigationController

    @discardableResult
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showSignin() {
        let controller = SigninViewController()
        controller.viewModel = SigninViewModel(useCase: NetworkProvider.current.authNetwork())
        navigationController.pushViewController(controller, animated: true)
    }
}
