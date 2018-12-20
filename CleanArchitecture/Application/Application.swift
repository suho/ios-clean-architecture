//
//  Application.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

let userDefaults = UserDefaults.standard

final class Application {
    static let shared = Application()

    private init() {}

    func splash(in window: UIWindow) {
        let navi = UINavigationController()
        let navigator = SplashNavigator(navigationController: navi)
        navigator.showSplash()
        window.rootViewController = navi
    }

    func home() {
        guard let window = AppDelegate.shared.window else { return }
        if userDefaults[.didLogin] {
            profile(in: window)
        } else {
            auth(in: window)
        }
    }

    private func auth(in window: UIWindow) {
        let navi = UINavigationController()
        let navigator = SigninNavigator(navigationController: navi)
        navigator.showSignin()
        window.rootViewController = navi
    }

    private func profile(in window: UIWindow) {
        let navi = UINavigationController()
        let navigator = MeNavigator(navigationController: navi)
        navigator.showProfile()
        window.rootViewController = navi
    }
}
