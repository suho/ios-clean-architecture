//
//  RealmProvider.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

final class RealmProvider {
    private let configuration: Realm.Configuration

    init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }

    func credential() -> CredentialUseCase {
        let repository = RealmRepository<Credential>(configuration: configuration)
        return CredentialRealm(repository: repository)
    }
}
