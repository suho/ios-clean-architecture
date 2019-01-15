//
//  AuthNetwork.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

final class UserNetwork: UserUseCase {

    private let router: Router<UserTarget>

    init(router: Router<UserTarget>) {
        self.router = router
    }

    func me() -> Observable<User> {
        return router.request(.me).map(User.self)
    }

    func register(username: String, avatar: String) -> Observable<User> {
        return router.request(.register(username: username, avatar: avatar)).map(User.self)
    }
}
