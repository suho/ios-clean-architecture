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
        let todayNavi = self.todayNavi()
        let historyNavi = self.historyNavi()
        let settingsNavi = self.settingsNavi()

        viewController?.viewControllers = [
            todayNavi,
            historyNavi,
            settingsNavi
        ]
    }

    private func todayNavi() -> UINavigationController {
        let todayViewController = TodayViewController()
        let todayNavigationController = NavigationController(rootViewController: todayViewController)
        todayNavigationController.tabBarItem = UITabBarItem(title: App.String.today,
                                                            image: App.Image.today,
                                                            tag: 0)
        return todayNavigationController
    }

    private func historyNavi() -> UINavigationController {
        let historyViewController = HistoryViewController()
        let historyNavigationController = NavigationController(rootViewController: historyViewController)
        historyNavigationController.tabBarItem = UITabBarItem(title: App.String.history,
                                                              image: App.Image.history,
                                                              tag: 1)
        return historyNavigationController
    }

    private func settingsNavi() -> UINavigationController {
        let settingsViewController = SettingsViewController()
        let settingsNavigationController = NavigationController(rootViewController: settingsViewController)
        settingsNavigationController.tabBarItem = UITabBarItem(title: App.String.settings, image: App.Image.settings, tag: 2)
        return settingsNavigationController
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
