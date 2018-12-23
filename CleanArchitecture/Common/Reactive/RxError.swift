//
//  RxError.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class RxError: SharedSequenceConvertibleType {
    typealias SharingStrategy = DriverSharingStrategy
    private let _subject = PublishSubject<Error>()

    deinit {
        _subject.onCompleted()
    }

    func asSharedSequence() -> SharedSequence<SharingStrategy, Error> {
        return _subject.asObservable().emptyDriverIfError()
    }

    func asObservable() -> Observable<Error> {
        return _subject.asObservable()
    }

    fileprivate func track<O: ObservableConvertibleType>(from source: O) -> Observable<O.E> {
        return source.asObservable().do(onError: onError)
    }

    private func onError(_ error: Error) {
        _subject.onNext(error)
    }
}

// MARK: - ObservableConvertibleType
extension ObservableConvertibleType {
    func trackError(into error: RxError) -> Observable<E> {
        return error.track(from: self)
    }
}
