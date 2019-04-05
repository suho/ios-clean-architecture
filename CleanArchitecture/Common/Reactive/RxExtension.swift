//
//  RxExtension.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 4/5/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension SharedSequence {
    public func unwrap<T>() -> SharedSequence<S, T> where E == T? {
        return self.filter { $0 != nil }.map({ (value) -> T in
            guard let value = value else { fatalError() }
            return value
        })
    }
}
