//
//  TabBarCoordinator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class TabBarCoordinator: Coordinate {

    weak var viewController: TabBarController?

    func showScreen(_ screen: TabBarCoordinator.Screen) {}

    func setupTabbar() {
        let today = todayNavi()
        let history = historyNavi()
        let settings = settingsNavi()

        viewController?.viewControllers = [
            today,
            history,
            settings
        ]
    }

    private func todayNavi() -> UINavigationController {
        let controller = TodayViewController()
        let repository = RealmRepository<Task>()
        let useCase = RealmTask(repository: repository)
        let coordinator = TodayCoordinator()
        coordinator.viewController = controller
        let viewModel = TodayViewModel(useCase: useCase, coordinator: coordinator)
        controller.viewModel = viewModel
        let navigationController = NavigationController(rootViewController: controller)
        navigationController.tabBarItem = UITabBarItem(title: App.String.today,
                                                       image: App.Image.today,
                                                       tag: 0)
        return navigationController
    }

    private func historyNavi() -> UINavigationController {
        let controller = HistoryViewController()
        let navigationController = NavigationController(rootViewController: controller)
        navigationController.tabBarItem = UITabBarItem(title: App.String.history,
                                                       image: App.Image.history,
                                                       tag: 1)
        return navigationController
    }

    private func settingsNavi() -> UINavigationController {
        let controller = SettingsViewController()
        let navigationController = NavigationController(rootViewController: controller)
        navigationController.tabBarItem = UITabBarItem(title: App.String.settings, image: App.Image.settings, tag: 2)
        return navigationController
    }
}

// MARK: - Screen
extension TabBarCoordinator {
    enum Screen {
        case today
        case history
        case settings
    }
}
