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

    func root(in window: UIWindow) {
        let tabbar = UITabBarController()
        window.rootViewController = tabbar
    }
}
