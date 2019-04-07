//
//  SettingsViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

final class SettingsViewController: ViewController, View {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: SettingsViewModel!

    override func setupUI() {
        super.setupUI()
        setupNavigation()
        setupTableView()
    }

    override func bindViewModel() {
        super.bindViewModel()
        let viewWillAppear = rx
            .sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .map { _ in return }.emptyDriverIfError()
        let input = SettingsViewModel.Input(loadTrigger: viewWillAppear)
        let output = viewModel.transform(input: input)
        output.viewModels.drive(tableView.rx.items(cellIdentifier: DetailCell.identify, cellType: DetailCell.self)) { (_, viewModel, cell) in
            cell.viewModel = viewModel
        }.disposed(by: bag)
    }
}

// MARK: - UI
extension SettingsViewController {
    private func setupNavigation() {
        title = App.String.settings
    }

    private func setupTableView() {
        tableView.backgroundColor = App.Theme.current.package.viewBackground
        tableView.register(UINib(nibName: DetailCell.identify, bundle: nil), forCellReuseIdentifier: DetailCell.identify)
        tableView.tableFooterView = UIView()
    }
}
