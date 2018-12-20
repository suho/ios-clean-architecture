//
//  Session.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

final class Session {
    static let current: Session = Session()
    var token: String?
}
