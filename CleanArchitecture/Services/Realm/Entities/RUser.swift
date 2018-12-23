//
//  RUser.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/23/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

final class RUser: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var avatarURL: String = ""
    @objc dynamic var bio: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - ModelConvertibleType
extension RUser: ModelConvertibleType {
    func asModel() -> User {
        return User(id: id, avatarURL: avatarURL, bio: bio)
    }
}

// MARK: - RealmRepresentable
extension User: RealmRepresentable {
    var uid: Int {
        return id
    }

    func asRealm() -> RUser {
        return RUser.build { object in
            object.id = uid
            object.avatarURL = avatarURL
            object.bio = bio
        }
    }
}
