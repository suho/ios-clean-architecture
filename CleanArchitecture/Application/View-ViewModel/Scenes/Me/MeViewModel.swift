//
//  MeViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation

final class MeViewModel: ViewModel {
    struct Input {}
    struct Output {}

    private let navigator: MeCoordinate

    init(navigator: MeCoordinate) {
        self.navigator = navigator
    }

    func transform(input: MeViewModel.Input) -> MeViewModel.Output {
        return Output()
    }
}
