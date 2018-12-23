//
//  KeychainQuery.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/23/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

extension Keychain {
    struct KeychainQuery {
        let service: String

        init(service: String) {
            self.service = service
        }

        func saveQuery(account: String, password: String) -> [String: Any] {
            guard let data = password.data(using: String.Encoding.utf8) else { fatalError() }
            return [kSecClass as String: kSecClassGenericPassword,
                    kSecAttrAccount as String: account,
                    kSecAttrService as String: service,
                    kSecValueData as String: data]
        }

        func searchQuery(with account: String) -> [String: Any] {
            return [kSecClass as String: kSecClassInternetPassword,
                    kSecAttrService as String: service,
                    kSecAttrAccount as String: account,
                    kSecMatchLimit as String: kSecMatchLimitOne,
                    kSecReturnAttributes as String: true,
                    kSecReturnData as String: true]
        }
    }
}
