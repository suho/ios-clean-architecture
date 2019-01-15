//
//  User.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

final class User {
    let id: Int
    let username: String
    let avatar: String

    init(id: Int, username: String, avatar: String) {
        self.id = id
        self.username = username
        self.avatar = avatar
    }
}

// MARK: - Codable
extension User: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case avatar
    }
}
