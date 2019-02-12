//
//  Task.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/15/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
typealias Seconds = Double

final class Task {
    let id: String
    var name: String
    var startAt: Date
    var createdAt: Date
    var updatedAt: Date
    var isFinish: Bool
    var isAlarm: Bool
    var noticeBefore: Seconds

    init(id: String = UUID().uuidString,
         name: String, startAt: Date, isAlarm: Bool,
         createdAt: Date = Date(), updatedAt: Date = Date(),
         isFinish: Bool = false, noticeBefore: Seconds = 60) {
        self.id = id
        self.name = name
        self.startAt = startAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.isFinish = isFinish
        self.isAlarm = isAlarm
        self.noticeBefore = noticeBefore
    }
}
