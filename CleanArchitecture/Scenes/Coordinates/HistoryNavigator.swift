//
//  HistoryNavigator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

private protocol Navigator {
    func showHistory()
}

final class HistoryNavigator: Navigator {

    private let navigationController: UINavigationController

    @discardableResult
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showHistory() {
        let controller = HistoryViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}
