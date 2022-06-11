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
    let toDoTableView: UITableView = {
        let table = UITableView()
        table.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.identifier)
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

        toDoTableView.delegate = self
        toDoTableView.dataSource = self
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
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor().setGold]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor().setGold]
        appearance.backgroundColor = UIColor().setPurple2
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
// MARK: - TableView Extension
extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier, for: indexPath) as! ToDoTableViewCell
        let toDoItem = toDoList[indexPath.row]
        let timeString = toDoItem.date.convertString
        let iconName = viewModel.getCheckboxImage(checkStatus: toDoItem.checkStatus)
        let descriptionText = toDoItem.description
        cell.configure(icon: iconName, name: toDoList[indexPath.row].title, time: timeString, description: descriptionText)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if toDoList[indexPath.row].description.count > 80 {
            return 160
        } else {
            return 120
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.changeStatusOfToDoItem(index: indexPath.row)
        updateUI()
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editButton = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.goToEditTaskPage(index: indexPath.row)
        }
        editButton.backgroundColor = UIColor().setGold
        let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { _, _ in
            self.viewModel.removeDataForStorage(index: indexPath.row)
            self.updateUI()
        }
        deleteButton.backgroundColor = .red
        return [editButton, deleteButton]
    }
}
