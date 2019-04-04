//
//  TodayViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class TodayViewModel: ViewModel {

    struct Input {
        let loadTrigger: Driver<Void>
        let addTrigger: Driver<Void>
        let updateTrigger: Driver<Task>
    }

    struct Output {
        let taskViewModels: Driver<[TaskCellViewModel]>
        let addTask: Driver<Void>
    }

    var coordinator: TodayCoordinator?
    private let useCase: TaskUseCase

    init(useCase: TaskUseCase, coordinator: TodayCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }

    func transform(input: Input) -> Output {
        let taskViewModels: Driver<[TaskCellViewModel]> = input.loadTrigger
            .flatMapLatest { _ -> Driver<[Task]> in
                return self.useCase.today().emptyDriverIfError()
            }
            .map { tasks -> [TaskCellViewModel] in
                return tasks.map { TaskCellViewModel(with: $0) }
            }
        let addTask = input.addTrigger.do(onNext: { _ in
            self.coordinator?.showScreen(.addTask)
        })
        let output = Output(taskViewModels: taskViewModels, addTask: addTask)
        return output
    }
}
