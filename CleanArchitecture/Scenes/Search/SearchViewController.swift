//
//  SearchViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

final class SearchViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: .zero)
        label.text = "Search"
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
    }
}
