//
//  Color.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

protocol ColorPackage {
    var tabbarBackground: UIColor { get }
    var tabbarText: UIColor { get }
    var tabbarTint: UIColor { get }
}

// MARK: - App Theme
extension App {
    enum Theme {
        case night
        case day

        static var current: Theme = .night

        var package: ColorPackage {
            switch self {
            case .day:
                return NightPackage()
            case .night:
                return NightPackage()
            }
        }
    }

    struct NightPackage: ColorPackage {
        var tabbarBackground: UIColor = UIColor(hex: 0x181818)
        var tabbarText: UIColor = UIColor(hex: 0x7f7f7f)
        var tabbarTint: UIColor = UIColor(hex: 0xff9500)
    }
}
