//
//  Task.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/15/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation

final class Task {
    let id: String
    var name: String
    var startAt: Date
    var createdAt: Date
    var updatedAt: Date
    var isFinish: Bool

    init(id: String = UUID().uuidString,
         name: String, startAt: Date,
         createdAt: Date = Date(), updatedAt: Date = Date(),
         isFinish: Bool = false) {
        self.id = id
        self.name = name
        self.startAt = startAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isFinish = isFinish
    }
}
