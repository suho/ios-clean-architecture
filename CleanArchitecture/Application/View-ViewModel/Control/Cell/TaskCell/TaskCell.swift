//
//  TaskCell.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/17/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class TaskCell: TableViewCell {
    @IBOutlet weak var verticalLineView: UIView!
    @IBOutlet weak var circleView: SView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var doneView: SView!
    @IBOutlet weak var checkedImageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var coverView: UIView!
    var viewModel: TaskCellViewModel! {
        didSet {
            guard viewModel != nil else { return }
            self.bind(self.viewModel)
        }
    }

    override func setupUI() {
        super.setupUI()
        setupVerticalLine()
        setupText()
        setupDoneButton()
        setupCoverView()
        setupContent()
    }

    private func bind(_ viewModel: TaskCellViewModel) {
        coverView.isHidden = !viewModel.isFinish
        checkedImageView.isHidden = !viewModel.isFinish
        if viewModel.isFinish {
            setupInactiveCirleView()
        } else {
            setupActiveCirleView()
        }
        titleLabel.text = viewModel.name
        timeLabel.text = viewModel.time
    }
}

// MARK: - Setup UI
extension TaskCell {
    private func setupVerticalLine() {
        verticalLineView.backgroundColor = App.Theme.current.package.taskCellVerticalLine
    }

    private func setupActiveCirleView() {
        circleView.fillColor = App.Theme.current.package.taskCellActiveCircle
        circleView.borderColor = App.Theme.current.package.taskCellActiveCircle
        circleView.shadowColor = App.Theme.current.package.taskCellActiveCircle
        circleView.setNeedsDisplay()
    }

    private func setupInactiveCirleView() {
        circleView.fillColor = App.Theme.current.package.taskCellInactiveCircle
        circleView.borderColor = App.Theme.current.package.taskCellInactiveCircle
        circleView.shadowColor = App.Theme.current.package.taskCellInactiveCircle
        circleView.setNeedsDisplay()
    }

    private func setupText() {
        titleLabel.textColor = App.Theme.current.package.taskCellTitle
        timeLabel.textColor = App.Theme.current.package.taskCellTime
    }

    private func setupDoneButton() {
        doneView.backgroundColor = App.Theme.current.package.taskCellDoneButton
        if let image = checkedImageView.image {
            checkedImageView.image = image.withRenderingMode(.alwaysTemplate)
        }
        checkedImageView.tintColor = App.Theme.current.package.taskCellTickImage
    }

    private func setupCoverView() {
        coverView.backgroundColor = App.Theme.current.package.taskCellCoverView
    }

    private func setupContent() {
        contentView.backgroundColor = App.Theme.current.package.taskCellBackground
    }
}
