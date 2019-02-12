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

    var viewModel: TodayViewModel!
    let updateTask: PublishSubject<Task> = PublishSubject<Task>()

    override func setupUI() {
        super.setupUI()
        setupNavigationBar()
        setupTableView()
    }

    override func bindViewModel() {
        super.bindViewModel()
        let viewWillAppear = rx
            .sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .map { _ in return }.emptyDriverIfError()
        let addTask = addButton.rx.tap.emptyDriverIfError()
        let updateTask = self.updateTask.asObserver().emptyDriverIfError()
        let input = TodayViewModel.Input(loadTrigger: viewWillAppear, addTrigger: addTask, updateTrigger: updateTask)
        let output = viewModel.transform(input: input)
        output.addTask.drive().disposed(by: bag)
        output.taskViewModels.drive(tableView.rx.items(cellIdentifier: TaskCell.identify, cellType: TaskCell.self)) { (_, viewModel, cell) in
            cell.viewModel = viewModel
            cell.doneButton.rx
                .tap
                .asDriver()
                .drive(onNext: { _ in print("test") })
                .disposed(by: cell.bag)
            }
            .disposed(by: bag)
    }
}

// MARK: - Setup UI
extension TodayViewController {
    private func setupNavigationBar() {
        title = App.String.today
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.rightBarButtonItem = button
        addButton = button
        navi?.isProgressHidden = false
    }

    private func setupTableView() {
        tableView.backgroundColor = App.Theme.current.package.viewBackground
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }
}
