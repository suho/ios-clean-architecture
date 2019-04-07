//
//  InfoTarget.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 4/6/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import Alamofire

enum InfoTarget {
    case about
}

// MARK: - TargetType
extension InfoTarget: TargetType {
    var baseURL: String {
        return "https://raw.githubusercontent.com/suho/ios-clean-architecture/master/api"
    }

    var path: String {
        switch self {
        case .about:
            return "/about.json"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .about:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .about:
            return .requestPlain
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
