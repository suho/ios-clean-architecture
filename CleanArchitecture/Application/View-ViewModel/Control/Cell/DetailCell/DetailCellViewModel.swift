//
//  CellViewModel.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 4/7/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation

final class DetailCellViewModel {
    let title: String
    let detail: String
    let kind: Kind

    init(kind: Kind, info: Info) {
        self.kind = kind
        switch kind {
        case .name:
            title = App.String.name
            detail = info.name
        case .author:
            title = App.String.author
            detail = info.author
        case .repo:
            title = App.String.repo
            detail = info.repo
        case .year:
            title = App.String.year
            detail = "\(info.year)"
        }
    }
}

// MARK: - Kind
extension DetailCellViewModel {
    enum Kind: CaseIterable {
        case name
        case author
        case repo
        case year
    }
}
