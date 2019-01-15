//
//  RTask.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/15/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

final class RTask: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var startAt: Date = Date()
    @objc dynamic var createdAt: Date = Date()
    @objc dynamic var updatedAt: Date = Date()
    @objc dynamic var isFinish: Bool = false
    @objc dynamic var noticeBefore: Seconds = 0

    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - ModelConvertibleType
extension RTask: ModelConvertibleType {
    func asModel() -> Task {
        return Task(id: id, name: name, startAt: startAt,
                    createdAt: createdAt, updatedAt: updatedAt,
                    isFinish: isFinish, noticeBefore: noticeBefore)
    }
}

// MARK: - RealmRepresentable
extension Task: RealmRepresentable {
    var uid: String {
        return id
    }

    func asRealm() -> RTask {
        return RTask.build {
            $0.id = uid
            $0.name = name
            $0.startAt = startAt
            $0.createdAt = createdAt
            $0.updatedAt = updatedAt
            $0.isFinish = isFinish
            $0.noticeBefore = noticeBefore
        }
    }
}
