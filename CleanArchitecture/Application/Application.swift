//
//  Application.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit
import Firebase

final class Application {
    static let current = Application()
    var coodinator: RootCoordinator?

    private init() {
        setupFirebase()
    }

    private func setupFirebase() {
        FirebaseApp.configure()
    }

    func root(in window: UIWindow?) {
        let coodinator = RootCoordinator()
        coodinator.window = window
        coodinator.showScreen(.tabBar)
    }
}
