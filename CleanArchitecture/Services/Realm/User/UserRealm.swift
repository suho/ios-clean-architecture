//
//  UserRealm.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/23/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

final class UserRealm<R: Repository>: UserUseCase, UserLocalUseCase where R.Entity == User {
    private let repository: R

    init(repository: R) {
        self.repository = repository
    }

    func profile() -> Observable<User> {
        return repository.findAll().flatMap { users -> Observable<User> in
            guard let user = users.first else { throw RealmError.notFound }
            return Observable.of(user)
        }
    }

    func save(user: User) -> Observable<User> {
        return repository.save(user)
    }
}
