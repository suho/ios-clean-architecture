//
//  AuthTarget.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Alamofire

enum AuthTarget {
    case user(Credential)
}

// MARK: - TargetType
extension AuthTarget: TargetType {
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
        case .user(let credential):
            return ["Authorization": "Token \(credential.uid)"]
        }
    }
}
