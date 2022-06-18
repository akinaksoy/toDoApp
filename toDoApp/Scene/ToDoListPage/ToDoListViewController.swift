//
//  ViewController.swift
//  toDoApp
// ş
//  Created by Akın Aksoy on 5.06.2022.
//

import UIKit

class ToDoListViewController: UIViewController {
    // MARK: UIProperties
    var toDoList: [ToDo] = [ToDo]()
    var viewModel = ToDoListViewModel.shared
    private lazy var toDoTableView: UITableView = {
        let table = UITableView()
        table.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    @objc func goToCreateScenePage() {
        let destinationVC = CreateToDoViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    @objc func goToEditTaskPage(index: Int) {
        let destinationVC = CreateToDoViewController()
        destinationVC.selectedToDoIndex = index
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        designTable()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        toDoTableView.frame = view.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        updateUI()
    }
    // MARK: Common Functions
    func updateUI() {
        DispatchQueue.main.async {
            self.toDoList = [Any]().toDoListorderByDate
            self.toDoTableView.reloadData()
        }
        let doneRatio = viewModel.getDoneRatio()
        title = "My To-Do List(\(doneRatio))"
    }
    func configureNavigationBar() {
        view.backgroundColor = UIColor().setPurple1
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus" ), style: .done, target: self, action: #selector(goToCreateScenePage))
        navigationItem.rightBarButtonItem?.tintColor = UIColor().setWhite1
        let appearance = NavigationBar.init().setNavigationBar(textColor: UIColor().setGold, backgroundColor: UIColor().setPurple2)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    func designTable() {
        toDoTableView.backgroundColor = UIColor().setPurple2
        toDoTableView.separatorColor = UIColor().setGold
        view.addSubview(toDoTableView)
        toDoTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview()
        }
    }
}
