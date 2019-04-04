//
//  Date.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/15/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation

// MARK: - Calendar
extension Calendar {
    init() {
        self.init(identifier: Calendar.Identifier.gregorian)
    }

    func dateComponents(from date: Date) -> DateComponents {
        return dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    }
}

// MARK: - DateComponents
extension DateComponents {
    mutating func begin() -> DateComponents {
        hour = 00
        minute = 00
        second = 00
        return self
    }

    mutating func end() -> DateComponents {
        hour = 23
        minute = 59
        second = 59
        return self
    }
}
