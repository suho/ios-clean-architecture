//
//  SigninViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SigninViewModel: ViewModel {
    struct Input {
        let token: Driver<String>
        let done: Driver<Void>
        let webButton: Driver<Void>
    }

    struct Output {
        let signin: Driver<Void>
        let error: Driver<Error>
        let webButton: Driver<Void>
    }

    private let navigator: SigninNavigator
    private let authService: AuthUseCase

    init(navigator: SigninNavigator, authService: AuthUseCase) {
        self.navigator = navigator
        self.authService = authService
    }

    func transform(input: SigninViewModel.Input) -> SigninViewModel.Output {
        let rxError = RxError()
        let indicator = RxIndicator()
        let trigger = input.done.withLatestFrom(input.token)
        let signin: Driver<Void> = trigger
            .flatMapLatest { token -> Driver<String> in
                return self
                    .authService
                    .signin(token: token)
                    .indicate(indicator)
                    .trackError(into: rxError)
                    .emptyDriverIfError()
                    .map { _ in return token }
            }
            .do(onNext: { token in
                Session.current.token = token
                self.navigator.showProfile()
            })
            .map { _ in return }
        let error = rxError
            .asDriver()
            .do(onNext: { (error) in
                self.navigator.showError(error)
            })
        let webButton = input.webButton
            .do(onNext: { _ in
                self.navigator.presentWeb()
            })
        return Output(signin: signin,
                      error: error,
                      webButton: webButton)
    }
}
