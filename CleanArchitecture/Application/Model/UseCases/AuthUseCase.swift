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
    func signin(credential: Credential) -> Observable<Void>
}

protocol CredentialUseCase {
    func save(credential: Credential) -> Observable<Credential>
    func fetch() -> Observable<Credential?>
    func clear(credential: Credential) -> Observable<Void>
}

protocol KeychainUseCase {
    func save(account: String, password: String) -> Observable<Void>
    func update(for account: String, with password: String) -> Observable<Void>
    func getPassword(of account: String) -> Observable<String>
}
