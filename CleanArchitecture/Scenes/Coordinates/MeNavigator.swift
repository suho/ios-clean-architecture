//
//  MeNavigator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

private protocol Navigator {
    func showMe()
}

final class MeNavigator: Navigator {

    private let navigationController: UINavigationController

    @discardableResult
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showMe() {
        let controller = MeViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}
