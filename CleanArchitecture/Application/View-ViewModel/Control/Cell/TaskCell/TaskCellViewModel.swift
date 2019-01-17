//
//  TaskViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/17/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation

final class TaskCellViewModel {
    let name: String
    let time: String
    let isFinish: Bool

    init(with task: Task) {
        name = task.name
        time = DateFormatter.hour.string(from: task.startAt)
        isFinish = task.isFinish
    }
}
