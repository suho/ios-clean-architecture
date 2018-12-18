//
//  Sequence.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/17/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

// MARK: - Array
extension Array {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

// MARK: - ArraySlice
extension ArraySlice {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

// MARK: - String
extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}
