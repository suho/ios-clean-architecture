//
//  SigninViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

final class SigninViewModel: ViewModel {
    struct Input {
        let trigger: Observable<String>
    }

    struct Output {
        let user: Observable<User>
    }

    private let useCase: AuthUseCase

    init(useCase: AuthUseCase) {
        self.useCase = useCase
    }

    func transform(input: SigninViewModel.Input) -> SigninViewModel.Output {
        let user = input.trigger.flatMapLatest { (str) -> Observable<User> in
            let credential = Credential(token: str)
            return self.useCase.user(credential: credential)
        }
        return Output(user: user)
    }
}
