//
//  AddTaskViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 4/4/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class AddTaskViewModel: ViewModel {
    struct Input {
        let cancelTrigger: Driver<Void>
        let saveTrigger: Driver<Void>
        let time: Driver<Date>
        let name: Driver<String>
    }

    struct Output {
        let cancel: Driver<Void>
        let save: Driver<Task>
    }

    var coordinator: AddTaskCoordinator?

    private let useCase: TaskUseCase

    init(useCase: TaskUseCase, coordinator: AddTaskCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }

    func transform(input: Input) -> Output {
        let cancel = input.cancelTrigger.do(onNext: { _ in
            self.coordinator?.showScreen(.dismiss)
        })
        let save: Driver<Task> = input
            .saveTrigger
            .debounce(0.3)
            .flatMapLatest { _  in
                return Driver.combineLatest(input.time, input.name)
            }
            .map { (date, name) -> Task in
                return Task(name: name, startAt: date)
            }
            .flatMapLatest { (task) in
                return self.useCase.add(task).emptyDriverIfError()
            }
            .do(onNext: { _ in
                self.coordinator?.showScreen(.dismiss)
            })
        return Output(cancel: cancel, save: save)
    }
}
