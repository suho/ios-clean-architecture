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
    let avatarURL: String
    let bio: String

    init(id: Int, avatarURL: String, bio: String) {
        self.id = id
        self.avatarURL = avatarURL
        self.bio = bio
    }
}

// MARK: - Codable
extension User: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatar_url"
        case bio
    }
}
