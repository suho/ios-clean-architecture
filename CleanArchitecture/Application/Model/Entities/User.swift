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
    let login: String
    let avatarURL: String
    let url: String
    let reposURL: String
    let type: String
    let siteAdmin: Bool
    let name: String
    let company: String
    let blog: String
    let email: String
    let hireable: Bool
    let bio: String
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let createdAt: Date
    let updatedAt: Date

    init(uid: Int, login: String, avatarURL: String, url: String,
         reposURL: String, type: String, siteAdmin: Bool, name: String,
         company: String, blog: String, email: String, hireable: Bool,
         bio: String, publicRepos: Int, publicGists: Int, followers: Int,
         following: Int, createdAt: Date, updatedAt: Date) {
        self.uid = uid
        self.login = login
        self.avatarURL = avatarURL
        self.url = url
        self.reposURL = reposURL
        self.type = type
        self.siteAdmin = siteAdmin
        self.name = name
        self.company = company
        self.blog = blog
        self.email = email
        self.hireable = hireable
        self.bio = bio
        self.publicRepos = publicRepos
        self.publicGists = publicGists
        self.followers = followers
        self.following = following
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

// MARK: - Codable
extension User: Codable {
    private enum CodingKeys: String, CodingKey {
        case uid = "id"
        case login
        case avatarURL = "avatar_url"
        case url
        case reposURL = "repos_url"
        case type
        case siteAdmin = "site_admin"
        case name, company, blog, email, hireable, bio
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
