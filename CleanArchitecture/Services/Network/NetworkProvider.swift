//
//  NetworkProvider.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/17/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkProvider {

    static let current: NetworkProvider = NetworkProvider()
    static var isOnline: Bool {
        if let manager = NetworkReachabilityManager() {
            return manager.isReachable
        } else {
            return false
        }
    }

    func auth() -> AuthUseCase {
        return AuthNetwork(router: Router<AuthTarget>())
    }

    func user() -> UserUseCase {
        return UserNetwork(router: Router<UserTarget>())
    }
}
