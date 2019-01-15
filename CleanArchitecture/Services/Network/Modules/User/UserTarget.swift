//
//  AuthTarget.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Alamofire

enum UserTarget {
    case register(username: String, avatar: String)
    case me
}

// MARK: - TargetType
extension UserTarget: TargetType {
    var baseURL: String {
        return "http://localhost:8000/users"
    }

    var path: String {
        switch self {
        case .register:
            return ""
        case .me:
            return "/me"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        case .me:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .register(let username, let avatar):
            let params: Parameters = [
                "username": username,
                "avatar": avatar
            ]
            return .requestParameters(params: params, encoding: URLEncoding.default)
        case .me:
            return .requestPlain
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
