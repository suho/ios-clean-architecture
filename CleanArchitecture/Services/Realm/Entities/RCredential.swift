//
//  RCredential.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
import RxRealm

final class RCredential: Object {
    @objc dynamic var uid: String = ""

    override class func primaryKey() -> String? {
        return "uid"
    }
}

// MARK: - ModelConvertibleType
extension RCredential: ModelConvertibleType {
    func asModel() -> Credential {
        return Credential(uid: uid)
    }
}

// MARK: - RealmRepresentable
extension Credential: RealmRepresentable {
    func asRealm() -> RCredential {
        return RCredential.build { object in
            object.uid = uid
        }
    }
}
