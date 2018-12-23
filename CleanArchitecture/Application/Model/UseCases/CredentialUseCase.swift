//
//  CredentialUseCase.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/23/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

protocol CredentialUseCase {
    func save(credential: Credential) -> Observable<Credential>
    func fetch() -> Observable<Credential?>
    func clear(credential: Credential) -> Observable<Void>
}
