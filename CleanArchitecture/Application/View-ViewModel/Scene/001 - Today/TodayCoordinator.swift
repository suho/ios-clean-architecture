//
//  TodayCoordinator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class TodayCoordinator: Coordinate {
    var viewController: TodayViewController?

    func showScreen(_ screen: TodayCoordinator.Screen) {
        switch screen {
        case .addTask:
            let controller = addTaskController()
            viewController?.present(controller, animated: true, completion: nil)
        case .detailTask: break
        }
    }

    private func addTaskController() -> UIViewController {
        let controller = AddTaskViewController()
        let repository = RealmRepository<Task>()
        let useCase = RealmTask(repository: repository)
        let coordinator = AddTaskCoordinator()
        coordinator.viewController = controller
        let viewModel = AddTaskViewModel(useCase: useCase, coordinator: coordinator)
        controller.viewModel = viewModel
        let navigationController = NavigationController(rootViewController: controller)
        return navigationController
    }
}

// MARK: - Screen
extension TodayCoordinator {
    enum Screen {
        case addTask
        case detailTask
    }
}
