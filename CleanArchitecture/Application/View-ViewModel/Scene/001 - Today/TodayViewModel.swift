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
        let addTask: Driver<Void>
        let doneTask: Driver<Task>
    }

    var coordinator: TodayCoordinator?
    private let useCase: TaskUseCase

    init(useCase: TaskUseCase) {
        self.useCase = useCase
    }

    func transform(input: Input) {
    }
}
