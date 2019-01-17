//
//  Coordinate.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinate {
    associatedtype Screen
    associatedtype View: UIViewController

    var viewController: View? { get set }

    func showScreen(_ screen: Screen)
    func showError(_ error: Error)
}

// MARK: - Coordinator
extension Coordinate {
    func showError(_ error: Error) {
        let alert = UIAlertController(title: App.String.appName, message: error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: App.String.ok, style: .cancel)
        alert.addAction(ok)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
