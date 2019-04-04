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
    }

    struct Output {
        let cancel: Driver<Void>
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
        return Output(cancel: cancel)
    }
}
