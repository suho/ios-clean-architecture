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

    func auth(in window: UIWindow) {
        let navi = UINavigationController()
        let navigator = SigninNavigator(navigationController: navi)
        navigator.showSignin()
        window.rootViewController = navi
    }

    func profile() {
        guard let window = AppDelegate.shared.window else { return }
        let navi = UINavigationController()
        let navigator = MeNavigator(navigationController: navi)
        navigator.showProfile()
        window.rootViewController = navi
    }
}
