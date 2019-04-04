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
    case profile
}

// MARK: - TargetType
extension UserTarget: TargetType {
    var baseURL: String {
        return "http://localhost:8000/users"
    }

    var path: String {
        switch self {
        case .profile:
            return ""
        }
    }

    var method: HTTPMethod {
        switch self {
        case .profile:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .profile:
            return .requestPlain
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
