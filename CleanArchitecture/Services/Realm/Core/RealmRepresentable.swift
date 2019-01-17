//
//  RealmRepresentable.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: ModelConvertibleType
    associatedtype KeyType
    var uid: KeyType { get }

    func asRealm() -> RealmType
}
