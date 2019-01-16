//
//  TabBarController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/15/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = App.Theme.current.package.tabbarBackground
        tabBar.tintColor = App.Theme.current.package.tabbarTint
        let controller1 = UIViewController()
        controller1.tabBarItem = UITabBarItem(title: "Today", image: UIImage(named: "img-today"), selectedImage: nil)
        let controller2 = UIViewController()
        controller2.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "img-history"), selectedImage: nil)
        let controller3 = UIViewController()
        controller3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "img-settings"), selectedImage: nil)
        viewControllers = [
            controller1,
            controller2,
            controller3
        ]
    }
}
