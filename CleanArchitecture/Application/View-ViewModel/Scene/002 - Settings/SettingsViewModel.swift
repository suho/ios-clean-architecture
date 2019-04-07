//
//  SettingsViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SettingsViewModel: ViewModel {

    var coordinator: SettingsCoordinator?
    private let useCase: InfoUseCase

    init(useCase: InfoUseCase, coordinator: SettingsCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }

    func transform(input: Input) -> Output {
        let indicator: RxIndicator = RxIndicator()
        let rxError: RxError = RxError()
        let viewModels: Driver<[DetailCellViewModel]> = input.loadTrigger
            .flatMapLatest { _ -> Driver<Info> in
                return self.useCase.about().indicate(indicator).trackError(into: rxError).emptyDriverIfError()
            }
            .map { info -> [DetailCellViewModel] in
                return DetailCellViewModel.Kind.allCases.map { DetailCellViewModel(kind: $0, info: info) }
            }
        let error = rxError.asObservable().do(onNext: { (error) in
            self.coordinator?.showError(error)
        }).emptyDriverIfError()
        let output = Output(viewModels: viewModels, indicator: indicator.asObservable().emptyDriverIfError(), error: error)
        return output
    }
}

// MARK: - Define
extension SettingsViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let viewModels: Driver<[DetailCellViewModel]>
        let indicator: Driver<Bool>
        let error: Driver<Error>
    }
}
