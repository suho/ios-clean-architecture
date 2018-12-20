//
//  MeViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxCocoa

final class MeViewModel: ViewModel {
    struct Input {}
    struct Output {
        let avatar: Driver<URL?>
        let bio: Driver<String>
        let error: Driver<Error>
    }

    private let navigator: MeNavigator
    private let userUseCase: UserUseCase

    init(navigator: MeNavigator, userUseCase: UserUseCase) {
        self.navigator = navigator
        self.userUseCase = userUseCase
    }

    func transform(input: MeViewModel.Input) -> MeViewModel.Output {
        let rxIndicator = RxIndicator()
        let rxError = RxError()
        let user = userUseCase.profile()
            .indicate(rxIndicator)
            .trackError(into: rxError)
            .emptyDriverIfError()
        _ = rxError.do(onNext: { (error) in
            self.navigator.showError(error)
        })
        let avatar = user.map { URL(string: $0.avatarURL) }
        let bio = user.map { $0.bio }
        return Output(avatar: avatar, bio: bio, error: rxError.asDriver())
    }
}
