//
//  DetailCell.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 4/7/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class DetailCell: TableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    var viewModel: DetailCellViewModel! {
        didSet {
            guard viewModel != nil else { return }
            self.bind(self.viewModel)
        }
    }

    override func setupUI() {
        super.setupUI()
        setupContent()
        setupTexts()
    }

    private func bind(_ viewModel: DetailCellViewModel) {
        titleLabel.text = viewModel.title
        detailLabel.text = viewModel.detail
    }
}

// MARK: - UI
extension DetailCell {
    private func setupContent() {
        backgroundColor = App.Theme.current.package.detailCellBackground
        contentView.backgroundColor = App.Theme.current.package.detailCellBackground
    }

    private func setupTexts() {
        titleLabel.textColor = App.Theme.current.package.detailCellText
        detailLabel.textColor = App.Theme.current.package.detailCellText
    }
}
