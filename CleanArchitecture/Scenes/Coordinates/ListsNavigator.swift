//
//  ListsNavigator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

private protocol Navigator {
    func showLists()
}

final class ListsNavigator: Navigator {

    private let navigationController: UINavigationController

    @discardableResult
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showLists() {
        let controller = ListsViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}
