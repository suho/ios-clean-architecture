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
    case user
}

// MARK: - TargetType
extension UserTarget: TargetType {
    var baseURL: String {
        return "https://api.github.com"
    }

    var path: String {
        switch self {
        case .user:
            return "/user"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .user:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .user:
            return .requestPlain
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .user:
            guard let token = Session.current.token else {
                return nil
            }
            return ["Authorization": "Token \(token)"]
        }
    }
}
