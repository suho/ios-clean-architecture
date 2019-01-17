//
//  SetttingsCoordinator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation

final class SettingsCoordinator: Coordinate {
    var viewController: SettingsViewController?

    func showScreen(_ screen: SettingsCoordinator.Screen) {
        switch screen {
        case .theme: break
        }
    }
}

// MARK: - Screen
extension SettingsCoordinator {
    enum Screen {
        case theme
    }
}
