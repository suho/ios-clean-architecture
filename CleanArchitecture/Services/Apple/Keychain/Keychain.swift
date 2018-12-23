//
//  Keychain.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Security

final class Keychain {
    private let service: String
    private static let service = "me.mlsuho.clean-architecture"
    private var query: KeychainQuery {
        return KeychainQuery(service: service)
    }

    static let current = Keychain()

    init(service: String = Keychain.service) {
        self.service = service
    }

    func save(account: String, password: String) throws {
        do {
            try get(account: account)
            try update(account: account, password: password)
        } catch KeychainError.noPassword {
            let saveQuery = query.saveQuery(account: account, password: password)
            let status = SecItemAdd(saveQuery as CFDictionary, nil)
            guard status == noErr else {
                throw Keychain.KeychainError.unhandledError(status: status)
            }
        } catch {
            throw error
        }
    }

    @discardableResult
    func get(account: String) throws -> String {
        var queryResult: CFTypeRef?
        let searchQuery = query.searchQuery(with: account)
        let status = withUnsafeMutablePointer(to: &queryResult, {
            SecItemCopyMatching(searchQuery as CFDictionary, UnsafeMutablePointer($0))
        })
        guard status != errSecItemNotFound else {
            throw KeychainError.noPassword
        }
        guard status == noErr else {
            throw KeychainError.unhandledError(status: status)
        }
        guard let existingItem = queryResult as? [String: Any],
            let passwordData = existingItem[kSecValueData as String] as? Data,
            let password = String(data: passwordData, encoding: String.Encoding.utf8)
            else {
                throw KeychainError.unexpectedPasswordData
        }
        return password
    }

    func update(account: String, password: String) throws {
        let updateItem = query.saveQuery(account: account, password: password)
        guard let data = password.data(using: String.Encoding.utf8) else { fatalError() }
        let updateAttributes: [String: Any] = [kSecValueData as String: data]
        let status = SecItemUpdate(updateItem as CFDictionary, updateAttributes as CFDictionary)
        guard status == noErr else {
            throw Keychain.KeychainError.unhandledError(status: status)
        }
    }
}
