//
//  AppDelegate.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        Application.current.root(in: window)
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let message = url.absoluteString
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        window?.rootViewController?.present(alertController, animated: true, completion: nil)
        return true
    }
}
