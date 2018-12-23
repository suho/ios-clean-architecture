//
//  Keychain+Rx.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/23/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

protocol KeychainUseCase {
    func save(account: String, password: String) -> Observable<Void>
    func update(account: String, password: String) -> Observable<Void>
    func get(account: String) -> Observable<String>
}

// MARK: - Reactive Keychain
extension Reactive: KeychainUseCase where Base: Keychain {
    func save(account: String, password: String) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            do {
                try self.base.save(account: account, password: password)
                observer.onNext(())
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func get(account: String) -> Observable<String> {
        return Observable.create { observer -> Disposable in
            do {
                let password = try self.base.get(account: account)
                observer.onNext(password)
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func update(account: String, password: String) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            do {
                try self.base.update(account: account, password: password)
                observer.onNext(())
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
}
