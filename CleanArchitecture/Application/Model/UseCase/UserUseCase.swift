//
//  File.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

protocol UserUseCase {
    func me() -> Observable<User>
    func register(username: String, avatar: String) -> Observable<User>
}
