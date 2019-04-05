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
        let updateTrigger: Driver<TaskCellViewModel>
        let deleteTrigger: Driver<IndexPath>
    }

    struct Output {
        let taskViewModels: Driver<[TaskCellViewModel]>
        let addTask: Driver<Void>
        let updateTask: Driver<Void>
        let progress: Driver<Float>
        let delete: Driver<Void>
    }

    var coordinator: TodayCoordinator?
    private let useCase: TaskUseCase

    init(useCase: TaskUseCase, coordinator: TodayCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }

    func transform(input: Input) -> Output {
        let taskViewModels: Driver<[TaskCellViewModel]> = input.loadTrigger
            .flatMapLatest { _ -> Driver<[Task]> in return self.useCase.today().emptyDriverIfError() }
            .map { tasks -> [TaskCellViewModel] in return tasks.map { TaskCellViewModel(with: $0) } }
        let addTask = input.addTrigger.do(onNext: { _ in self.coordinator?.showScreen(.addTask) })
        let updateTask = input
            .updateTrigger
            .flatMapLatest { viewModel in return self.useCase.find(by: viewModel.taskId).take(1).emptyDriverIfError() }
            .unwrap()
            .map({ (task) -> Task in
                task.updateStatus()
                return task
            })
            .flatMapLatest { (task) in return self.useCase.update(task).emptyDriverIfError() }
            .map({ _ in return })
        let progress: Driver<Float> = input.loadTrigger
            .flatMapLatest { _ -> Driver<[Task]> in return self.useCase.today().emptyDriverIfError() }
            .map { (tasks) -> Float in
                let total = Float(tasks.count)
                if total == 0 { return 0 }
                let done = Float(tasks.filter { $0.isFinish }.count)
                return done/total
            }
        let delete: Driver<Void> = input
            .deleteTrigger
            .withLatestFrom(taskViewModels) { (indexPath, taskCellViewModels) -> TaskCellViewModel in
                let row = indexPath.row
                if row < 0 && row >= taskCellViewModels.count { fatalError() }
                let viewModel = taskCellViewModels[row]
                return viewModel
            }
            .flatMapLatest { viewModel in return self.useCase.find(by: viewModel.taskId).take(1).emptyDriverIfError() }
            .unwrap()
            .flatMapLatest { (task) in return self.useCase.delete(task).emptyDriverIfError() }
            .map({ _ in return })
        let output = Output(taskViewModels: taskViewModels, addTask: addTask, updateTask: updateTask, progress: progress, delete: delete)
        return output
    }
}
