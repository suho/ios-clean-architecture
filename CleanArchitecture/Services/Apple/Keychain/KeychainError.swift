//
//  KeychainError.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/23/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

extension Keychain {
    enum KeychainError: Error {
        case noPassword
        case unexpectedPasswordData
        case unexpectedItemData
        case unhandledError(status: OSStatus)
    }
}
