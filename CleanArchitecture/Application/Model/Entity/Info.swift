//
//  Info.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 4/6/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation

final class Info {
    let name: String
    let author: String
    let url: String
    let year: Int

    init(name: String, author: String, url: String, year: Int) {
        self.name = name
        self.author = author
        self.url = url
        self.year = year
    }
}

// MARK: - Codable
extension Info: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case author
        case url
        case year
    }
}
