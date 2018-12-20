//
//  Credential.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxRealm
import RxSwift

final class CredentialRealm<R: Repository>: CredentialUseCase where R.Entity == Credential {

    private let repository: R

    init(repository: R) {
        self.repository = repository
    }

    func save(credential: Credential) -> Observable<Credential> {
        return repository.save(credential)
    }

    func fetch() -> Observable<Credential?> {
        return repository.findAll().map { credentials -> Credential? in
            return credentials.first
        }
    }

    func clear(credential: Credential) -> Observable<Void> {
        return repository.delete(credential)
    }
}
