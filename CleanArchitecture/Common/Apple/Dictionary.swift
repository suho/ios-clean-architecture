//
//  Dictionary.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/17/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {

    /// Get New Object with Keypath
    ///
    /// - Parameter key: Keypath for access to exactly object
    /// - Returns: New Object From Dictionary
    /// Key example:
    /// - "data" ~ Access to key "data"
    /// - "data.object" ~ Access to key "data", then key "object"
    /// - "data.3.id" ~ Access to key "data", then get object index 3 in Array data, then get id of that object
    func value(of key: String) -> Any? {
        let keyPaths = ArraySlice(key.components(separatedBy: "."))
        return jsonObject(keyPaths, dictionary: self)
    }

    private func jsonObject(_ keyPaths: ArraySlice<String>, dictionary: [String: Any]) -> Any? {
        guard keyPaths.isNotEmpty,
            let keyPath = keyPaths.first,
            let object = dictionary[keyPath] else { return nil}
        if let dict = object as? [String: Any], keyPaths.count > 1 {
            let tail = keyPaths.dropFirst()
            return jsonObject(tail, dictionary: dict)
        } else if let array = object as? [Any], keyPaths.count > 1 {
            let tail = keyPaths.dropFirst()
            return arrayObject(tail, array: array)
        } else {
            return object
        }
    }

    private func arrayObject(_ keyPaths: ArraySlice<String>, array: [Any]) -> Any? {
        guard keyPaths.isNotEmpty,
            let keyPath = keyPaths.first,
            let index = Int(keyPath),
            index >= 0,
            index < array.count else { return nil }
        let object = array[index]
        if let dict = object as? [String: Any], keyPaths.count > 1 {
            let tail = keyPaths.dropFirst()
            return jsonObject(tail, dictionary: dict)
        } else if let array = object as? [Any], keyPaths.count > 1 {
            let tail = keyPaths.dropFirst()
            return arrayObject(tail, array: array)
        } else {
            return object
        }
    }
}
