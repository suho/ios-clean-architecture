//
//  SplashViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxCocoa

final class SplashViewModel: ViewModel {
    struct Input {}
    struct Output {
        let credential: Driver<Credential?>
    }

    private let credentialUseCase: CredentialUseCase
    private let navigator: SplashCoordinate

    init(credentialUseCase: CredentialUseCase, navigator: SplashCoordinate) {
        self.credentialUseCase = credentialUseCase
        self.navigator = navigator
    }

    func transform(input: SplashViewModel.Input) -> SplashViewModel.Output {
        let credential = credentialUseCase
            .fetch()
            .emptyDriverIfError()
            .do(onNext: { (credential) in
                Session.current.token = credential?.uid
                self.navigator.showHome()
            })
        return Output(credential: credential)
    }
}
