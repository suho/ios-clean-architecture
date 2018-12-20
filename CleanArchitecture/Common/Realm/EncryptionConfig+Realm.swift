//
//  EncryptionConfig+Realm.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

extension Realm {
    static let encrypConfig: Realm.Configuration = {
        var key = Data(count: 64)
        _ = key.withUnsafeMutableBytes { bytes in
            SecRandomCopyBytes(kSecRandomDefault, 64, bytes)
        }
        let config = Realm.Configuration(encryptionKey: key)
        return config
    }()

}
