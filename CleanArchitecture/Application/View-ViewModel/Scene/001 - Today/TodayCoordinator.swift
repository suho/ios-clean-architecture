//
//  TodayCoordinator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation

final class TodayCoordinator: Coordinate {
    var viewController: TodayViewController?

    func showScreen(_ screen: TodayCoordinator.Screen) {
        switch screen {
        case .addTask: break
        case .detailTask: break
        }
    }
}

// MARK: - Screen
extension TodayCoordinator {
    enum Screen {
        case addTask
        case detailTask
    }
}
