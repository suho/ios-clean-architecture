//
//  MeViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

final class MeViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: .zero)
        label.text = "Me"
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
    }
}
