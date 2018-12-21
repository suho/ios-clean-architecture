//
//  MeViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit
import RxCocoa

final class MeViewController: ViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!

    var viewModel: MeViewModel!

    override func setupUI() {
        super.setupUI()
        navigationController?.isNavigationBarHidden = true
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.layer.masksToBounds = true
    }

    override func bindViewModel() {
        super.bindViewModel()
        let output = viewModel.transform(input: MeViewModel.Input())
        output.avatar.drive(avatarImageView.rx.url).disposed(by: bag)
        output.bio.drive(bioLabel.rx.text).disposed(by: bag)
        output.error.drive().disposed(by: bag)
    }
}
