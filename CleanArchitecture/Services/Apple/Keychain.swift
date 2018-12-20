//
//  Keychain.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Security
import RxSwift
import RxCocoa

final class Keychain: KeychainUseCase {
    static let current = Keychain()

    func save(account: String, password: String) -> Observable<Void> {
        return getPassword(of: account)
            .flatMapLatest { _ in
                return self.update(for: account, with: password)
            }
            .saveIfError(with: account, and: password)
    }

    func update(for account: String, with password: String) -> Observable<Void> {
        return Observable.create { observer in
            let updateItem = Keychain.KeychainQuery(account: account, password: password).saveQuery()
            guard let data = password.data(using: String.Encoding.utf8) else { fatalError() }
            let updateAttributes: [String: Any] = [kSecValueData as String: data]
            let status = SecItemUpdate(updateItem as CFDictionary, updateAttributes as CFDictionary)
            guard status == noErr else {
                observer.onError(Keychain.KeychainError.unhandledError(status: status))
                return Disposables.create()
            }
            observer.onNext(())
            observer.onCompleted()
            return Disposables.create()
        }
    }

    func getPassword(of account: String) -> Observable<String> {
        return Observable.create { observer in
            var queryResult: CFTypeRef?
            let query = Keychain.KeychainQuery.searchQuery(with: account)
            let status = withUnsafeMutablePointer(to: &queryResult, {
                SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
            })
            guard status != errSecItemNotFound else {
                observer.onError(KeychainError.noPassword)
                return Disposables.create()
            }
            guard status == noErr else {
                observer.onError(KeychainError.unhandledError(status: status))
                return Disposables.create()
            }
            guard let existingItem = queryResult as? [String: Any],
                let passwordData = existingItem[kSecValueData as String] as? Data,
                let password = String(data: passwordData, encoding: String.Encoding.utf8)
                else {
                    observer.onError(KeychainError.unexpectedPasswordData)
                    return Disposables.create()
            }
            observer.onNext(password)
            observer.onCompleted()
            return Disposables.create()
        }

    }
}

// MARK: - ObservableType
extension ObservableType where E == Void {
    fileprivate func saveIfError(with account: String, and password: String) -> Observable<Void> {
        return catchError { _ in
            return Observable<Void>.create { observer in
                let newItem = Keychain.KeychainQuery(account: account, password: password).saveQuery()
                let status = SecItemAdd(newItem as CFDictionary, nil)
                guard status == noErr else {
                    observer.onError(Keychain.KeychainError.unhandledError(status: status))
                    return Disposables.create()
                }
                observer.onNext(())
                observer.onCompleted()
                return Disposables.create()
            }
        }
    }
}

// MARK: - Keychain Define
extension Keychain {
    enum KeychainError: Error {
        case noPassword
        case unexpectedPasswordData
        case unexpectedItemData
        case unhandledError(status: OSStatus)
    }

    struct KeychainQuery {
        let account: String
        let service: String
        let password: String

        static let service = "me.mlsuho.clean-architecture"

        init(account: String, password: String) {
            self.account = account
            self.password = password
            self.service = KeychainQuery.service
        }

        func saveQuery() -> [String: Any] {
            guard let data = password.data(using: String.Encoding.utf8) else { fatalError() }
            return [kSecClass as String: kSecClassGenericPassword,
                    kSecAttrAccount as String: account,
                    kSecAttrService as String: service,
                    kSecValueData as String: data]
        }

        static func searchQuery(with account: String) -> [String: Any] {
            return [kSecClass as String: kSecClassInternetPassword,
                    kSecAttrService as String: service,
                    kSecAttrAccount as String: account,
                    kSecMatchLimit as String: kSecMatchLimitOne,
                    kSecReturnAttributes as String: true,
                    kSecReturnData as String: true]
        }
    }
}
