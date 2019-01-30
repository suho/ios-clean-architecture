//
//  RealmTask.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/15/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

final class RealmTask<R: Repository>: TaskUseCase where R.Entity == Task {
    private let repository: R

    init(repository: R) {
        self.repository = repository
    }

    func add(_ task: Task) -> Observable<Task> {
        return repository.save(task)
    }

    func update(_ task: Task) -> Observable<Task> {
        return repository.save(task)
    }

    func today() -> Observable<[Task]> {
        let calendar = Calendar()
        let today = Date()
        var components = calendar.dateComponents(from: today)
        guard let startDate = calendar.date(from: components.begin()),
            let endDate = calendar.date(from: components.end()) else {
                return Observable.error(RealmError.system)
        }
        let predicate = NSPredicate(format: "startAt >= %@ AND startAt =< %@", argumentArray: [startDate, endDate])
        let sortDescriptors: [NSSortDescriptor] = [NSSortDescriptor(key: "isFinish", ascending: true),
                                                   NSSortDescriptor(key: "startAt", ascending: true)]
        return repository.find(with: predicate, sortDescriptors: sortDescriptors)
    }

    func history() -> Observable<[Task]> {
        return repository.findAll()
    }
}
