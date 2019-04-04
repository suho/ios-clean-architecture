//
//  RxIndicator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SVProgressHUD

final class RxIndicator: ObservableConvertibleType {
    private let _relay = BehaviorRelay(value: false)
    private let _loading: Observable<Bool>

    init() {
        _loading = _relay.distinctUntilChanged()
    }

    func asObservable() -> Observable<Bool> {
        return _loading.asObservable()
    }

    fileprivate func track<O: ObservableConvertibleType>(_ source: O) -> Observable<O.E> {
        return source.asObservable()
            .do(onNext: { _ in
                self.dismiss()
            }, onError: { _ in
                self.dismiss()
            }, onCompleted: {
                self.dismiss()
            }, onSubscribe: show)
    }

    private func show() {
        _relay.accept(true)
        SVProgressHUD.show()
    }

    private func dismiss() {
        _relay.accept(false)
        SVProgressHUD.popActivity()
    }
}

// MARK: - ObservableConvertibleType
extension ObservableConvertibleType {
    func indicate(_ indicator: RxIndicator) -> Observable<E> {
        return indicator.track(self)
    }
}
