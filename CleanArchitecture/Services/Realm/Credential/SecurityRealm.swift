//
//  SecurityRealm.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Security
import Realm
import RealmSwift

final class SecurityRealm {
    static let configuration: Realm.Configuration = {
        return Realm.Configuration(encryptionKey: credentialKey)
    }()

    private static let credentialKey: Data = {
        let keyChainId = "me.mlsuho.clean-architecture.realm.key"
        guard let keychainData = keyChainId.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
            fatalError()
        }

        var query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: keychainData,
            kSecAttrKeySizeInBits as String: 512,
            kSecReturnData as String: true
        ]

        var dataTypeRef: CFTypeRef?
        var status = withUnsafeMutablePointer(to: &dataTypeRef) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        if status == errSecSuccess, let dataTypeRef = dataTypeRef as? Data {
            return dataTypeRef
        }

        guard let keyData = NSMutableData(length: 64) else { fatalError() }
        let result = SecRandomCopyBytes(kSecRandomDefault, 64, keyData.mutableBytes.bindMemory(to: UInt8.self, capacity: 64))
        query = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: keychainData,
            kSecAttrKeySizeInBits as String: 512,
            kSecValueData as String: keyData
        ]
        status = SecItemAdd(query as CFDictionary, nil)
        return keyData as Data
    }()
}
