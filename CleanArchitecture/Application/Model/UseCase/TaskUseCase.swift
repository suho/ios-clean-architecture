//
//  TaskUseCase.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/15/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

protocol TaskUseCase {
    func add(_ task: Task) -> Observable<Task>
    func update(_ task: Task) -> Observable<Task>
    func today() -> Observable<[Task]>
    func find(by id: String) -> Observable<Task?>
    func delete(_ task: Task) -> Observable<Void>
}
