//
//  User.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

final class User {
    let uid: Int
    init(uid: Int) {
        self.uid = uid
    }
}

// MARK: - Codable
extension User: Codable {
    private enum CodingKeys: String, CodingKey {
        case uid = "id"
    }
}
