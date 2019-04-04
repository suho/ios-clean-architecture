//
//  TableViewCell.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/17/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit
import RxSwift

class TableViewCell: UITableViewCell {

    let bag: DisposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupUI()
    }

    func setupUI() {}
}
