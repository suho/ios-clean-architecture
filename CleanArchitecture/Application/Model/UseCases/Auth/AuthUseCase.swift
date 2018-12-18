//
//  AuthUseCase.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

protocol AuthUseCase {
    func user(credential: Credential) -> Observable<User>
}
