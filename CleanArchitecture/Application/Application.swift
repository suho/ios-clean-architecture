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
        let nagigator = AuthNavigator(navigationController: navi)
        nagigator.showSignin()
        window.rootViewController = navi
    }
}
