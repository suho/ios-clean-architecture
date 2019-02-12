//
//  NavigationController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    weak var progress: UIProgressView!
    var isProgressHidden: Bool = true {
        didSet {
            setupProgress()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationBar.prefersLargeTitles = true
        navigationBar.barStyle = .black
        navigationBar.tintColor = App.Theme.current.package.tabbarTint
    }

    private func setupProgress() {
        if isProgressHidden {
            if progress != nil {
                progress.removeFromSuperview()
                updateViewConstraints()
            }
        } else {
            let progress = UIProgressView(progressViewStyle: .bar)
            progress.translatesAutoresizingMaskIntoConstraints = false
            progress.progress = 0.5
            progress.backgroundColor = .black
            navigationBar.addSubview(progress)
            NSLayoutConstraint.activate([
                progress.heightAnchor.constraint(equalToConstant: 5),
                progress.leftAnchor.constraint(equalTo: navigationBar.leftAnchor),
                progress.rightAnchor.constraint(equalTo: navigationBar.rightAnchor),
                progress.topAnchor.constraint(equalTo: navigationBar.bottomAnchor)
                ])
            self.progress = progress
        }
    }
}
