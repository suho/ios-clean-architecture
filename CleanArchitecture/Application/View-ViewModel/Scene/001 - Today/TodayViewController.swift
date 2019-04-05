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
    let updateTask: PublishSubject<TaskCellViewModel> = PublishSubject<TaskCellViewModel>()

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
        let deleteTrigger = tableView.rx.itemDeleted.asDriver()
        let input = TodayViewModel.Input(loadTrigger: viewWillAppear, addTrigger: addTask, updateTrigger: updateTask, deleteTrigger: deleteTrigger)
        let output = viewModel.transform(input: input)
        output.addTask.drive().disposed(by: bag)
        output.updateTask.drive().disposed(by: bag)
        if let navi = navi {
            output.progress.drive(navi.progress.rx.progress).disposed(by: bag)
        }
        output.taskViewModels.drive(tableView.rx.items(cellIdentifier: TaskCell.identify, cellType: TaskCell.self)) { (_, viewModel, cell) in
            cell.viewModel = viewModel
            cell.doneButton.rx.tap.asDriver().debounce(0.4)
                .drive(onNext: { _ in
                    self.updateTask.onNext(viewModel)
                })
                .disposed(by: cell.bag)
            }
            .disposed(by: bag)
        output.delete.drive().disposed(by: bag)
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
        tableView.register(UINib(nibName: TaskCell.identify, bundle: nil), forCellReuseIdentifier: TaskCell.identify)
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }
}
