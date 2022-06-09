//
//  ViewController.swift
//  toDoApp
//ş
//  Created by Akın Aksoy on 5.06.2022.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    var toDoList = toDoManager.shared.fetchData()
    
    let toDoTableView : UITableView = {
       let table = UITableView()
        table.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        configureNavigationBar()
        designTable()
    }
    func configureNavigationBar(){
        view.backgroundColor = UIColor().setPurple1
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus" ), style: .done, target: self, action: #selector(goToCreateScenePage))
        navigationItem.rightBarButtonItem?.tintColor = UIColor().setWhite1
        title = "My To-Do List"
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        toDoTableView.frame = view.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.toDoList = toDoManager.shared.fetchData()
            self.toDoTableView.reloadData()
        }
    }
    @objc func goToCreateScenePage(){
        let vc = createToDoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension ToDoListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier, for: indexPath) as! ToDoTableViewCell
        cell.configure(icon: "checkmark.square", name: toDoList[indexPath.row].title, time: "22.02.2021 - 14.30")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    
}