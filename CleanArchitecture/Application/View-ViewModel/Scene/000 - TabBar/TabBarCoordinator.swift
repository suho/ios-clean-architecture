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
        let settings = settingsNavi()

        viewController?.viewControllers = [
            today,
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

    private func settingsNavi() -> UINavigationController {
        let controller = SettingsViewController()
        let router = Router<InfoTarget>()
        let useCase = InfoNetwork(router: router)
        let coordinator = SettingsCoordinator()
        let viewModel = SettingsViewModel(useCase: useCase, coordinator: coordinator)
        controller.viewModel = viewModel
        let navigationController = NavigationController(rootViewController: controller)
        navigationController.tabBarItem = UITabBarItem(title: App.String.settings,
                                                       image: App.Image.settings,
                                                       tag: 1)
        return navigationController
    }
}

// MARK: - Screen
extension TabBarCoordinator {
    enum Screen {
        case today
        case settings
    }
}
