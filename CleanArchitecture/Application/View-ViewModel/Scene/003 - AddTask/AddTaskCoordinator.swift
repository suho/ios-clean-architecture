//
//  AddTaskCoordinator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 4/4/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import UIKit

final class AddTaskCoordinator: Coordinate {

    var viewController: AddTaskViewController?

    func showScreen(_ screen: AddTaskCoordinator.Screen) {
        switch screen {
        case .dismiss:
            viewController?.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - Screen
extension AddTaskCoordinator {
    enum Screen {
        case dismiss
    }
}
