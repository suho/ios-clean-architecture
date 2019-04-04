//
//  ViewModel.swift
//  Common
//
//  Created by Su Ho V. on 12/9/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    associatedtype CoordinatorType: Coordinate

    var coordinator: CoordinatorType? { get set }

    func transform(input: Input) -> Output
}
