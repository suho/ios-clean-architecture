//
//  TodayViewController.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class TodayViewController: ViewController, View {
    @IBOutlet weak var tableView: UITableView!
    weak var addButton: UIBarButtonItem!
    weak var progress: UIProgressView!

    var viewModel: TodayViewModel!

    override func setupUI() {
        super.setupUI()
        setupNavigationBar()
        setupTableView()
    }

    override func bindViewModel() {
        super.bindViewModel()
        addButton.rx.tap.subscribe(onNext: { _ in
            print("tab")
        }).disposed(by: bag)
        let dummyViewModels: [TaskCellViewModel] = [
            TaskCellViewModel(with: Task(name: "Do homework 1", startAt: Date(), isFinish: false)),
            TaskCellViewModel(with: Task(name: "Do homework 3", startAt: Date(), isFinish: false)),
            TaskCellViewModel(with: Task(name: "Do homework 6", startAt: Date(), isFinish: false)),
            TaskCellViewModel(with: Task(name: "Do homework 7", startAt: Date(), isFinish: false)),
            TaskCellViewModel(with: Task(name: "Do homework 4", startAt: Date(), isFinish: true)),
            TaskCellViewModel(with: Task(name: "Do homework 2", startAt: Date(), isFinish: true)),
            TaskCellViewModel(with: Task(name: "Do homework 5", startAt: Date(), isFinish: true))
        ]
        Observable.of(dummyViewModels)
            .emptyDriverIfError()
            .drive(tableView.rx.items(cellIdentifier: "TaskCell", cellType: TaskCell.self)) { (_, viewModel, cell) in
                cell.bind(viewModel)
            }.disposed(by: bag)
    }
}

// MARK: - Setup UI
extension TodayViewController {
    private func setupNavigationBar() {
        title = App.String.today
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.rightBarButtonItem = button
        addButton = button

        let progress = UIProgressView(progressViewStyle: .bar)
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 0.5
        progress.backgroundColor = .black
        if let navBar = navigationController?.navigationBar {
            navBar.addSubview(progress)
            NSLayoutConstraint.activate([
                progress.heightAnchor.constraint(equalToConstant: 5),
                progress.leftAnchor.constraint(equalTo: navBar.leftAnchor),
                progress.rightAnchor.constraint(equalTo: navBar.rightAnchor),
                progress.topAnchor.constraint(equalTo: navBar.bottomAnchor)
                ])
        }
        self.progress = progress
    }

    private func setupTableView() {
        tableView.backgroundColor = App.Theme.current.package.viewBackground
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }
}
