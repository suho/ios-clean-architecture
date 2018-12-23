//
//  Driver.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    func emptyDriverIfError() -> Driver<E> {
        return asDriver { _ in return Driver<E>.empty() }
    }

    func emptyObservableIfError() -> Observable<E> {
        return catchError { _ in return Observable<E>.empty() }
    }
}
