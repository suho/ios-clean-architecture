//
//  Application.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

final class Application {
    static let shared = Application()

    private init() {}

    func tabbar(in window: UIWindow) {
        let searchNaviController = UINavigationController()
        searchNaviController.tabBarItem = UITabBarItem(title: "Search", image: nil, selectedImage: nil)
        let searchNavigator = SearchNavigator(navigationController: searchNaviController)
        searchNavigator.showSearch()

        let listsNaviController = UINavigationController()
        listsNaviController.tabBarItem = UITabBarItem(title: "Lists", image: nil, selectedImage: nil)
        let listsNavigator = ListsNavigator(navigationController: listsNaviController)
        listsNavigator.showLists()

        let historyNaviController = UINavigationController()
        historyNaviController.tabBarItem = UITabBarItem(title: "History", image: nil, selectedImage: nil)
        let historyNavigator = HistoryNavigator(navigationController: historyNaviController)
        historyNavigator.showHistory()

        let meNaviController = UINavigationController()
        meNaviController.tabBarItem = UITabBarItem(title: "Me", image: nil, selectedImage: nil)
        let meNavigator = MeNavigator(navigationController: meNaviController)
        meNavigator.showMe()

        let tabbar = UITabBarController()
        tabbar.viewControllers = [
            searchNaviController,
            listsNaviController,
            historyNaviController,
            meNaviController
        ]
        window.rootViewController = tabbar
    }
}
