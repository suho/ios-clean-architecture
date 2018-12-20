//
//  ViewModel.swift
//  Common
//
//  Created by Su Ho V. on 12/9/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

public protocol ViewModel {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
