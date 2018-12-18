//
//  Credential.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

final class Credential {
    var token: String = ""

    init() {}

    init(token: String) {
        self.token = token
    }

    func clear() {
        token = ""
    }
}
