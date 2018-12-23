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
    static let standard = RealmProvider()

    init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }

    func user() -> UserUseCase & UserLocalUseCase {
        let repository = RealmRepository<User>(configuration: configuration)
        return UserRealm(repository: repository)
    }
}
