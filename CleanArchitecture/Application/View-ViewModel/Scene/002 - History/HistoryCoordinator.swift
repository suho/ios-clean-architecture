//
//  HistoryCoordinator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation

final class HistoryCoordinator: Coordinate {
    var viewController: HistoryViewController?

    func showScreen(_ screen: HistoryCoordinator.Screen) {
        switch screen {
        case .detailTask: break
        }
    }
}

// MARK: - Screen
extension HistoryCoordinator {
    enum Screen {
        case detailTask
    }
}
