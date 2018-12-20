//
//  UserDefaults.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

final class DefaultsKeys {
    let key: String
    init(_ key: String) {
        self.key = key
    }
}

// MARK: - Define
extension DefaultsKeys {
    static let didLogin: DefaultsKeys = DefaultsKeys("didLogin")
}

// MARK: - Subscript
extension UserDefaults {
    subscript(key: DefaultsKeys) -> Bool {
        get {
            return bool(forKey: key.key)
        }
        set {
            set(newValue, forKey: key.key)
        }
    }
}
