//
//  MeViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class MeViewModel: ViewModel {
    struct Input {}
    struct Output {
        let avatar: Driver<URL?>
        let bio: Driver<String>
        let error: Driver<Error>
    }

    private let navigator: MeNavigator
    private let networkService: UserUseCase
    private let realmService: UserUseCase & UserLocalUseCase

    init(navigator: MeNavigator, networkService: UserUseCase, realmService: UserUseCase & UserLocalUseCase) {
        self.navigator = navigator
        self.networkService = networkService
        self.realmService = realmService
    }

    func transform(input: MeViewModel.Input) -> MeViewModel.Output {
        let rxIndicator = RxIndicator()
        let rxError = RxError()
        let user: Driver<User> = networkService.profile()
            .indicate(rxIndicator)
            .trackError(into: rxError)
            .flatMapLatest({ user -> Observable<User> in
                return self.realmService.save(user: user)
            })
            .asDriver { _ -> Driver<User> in
                return self.realmService.profile().emptyDriverIfError()
            }
        _ = rxError.do(onNext: { (error) in
            self.navigator.showError(error)
        })
        let avatar = user.map { URL(string: $0.avatarURL) }
        let bio = user.map { $0.bio }
        return Output(avatar: avatar, bio: bio, error: rxError.asDriver())
    }
}
