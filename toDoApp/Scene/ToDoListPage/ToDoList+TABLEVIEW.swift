//
//  ToDoList+TABLEVIEW.swift
//  toDoApp
//
//  Created by Akın Aksoy on 18.06.2022.
//

import Foundation
import UIKit
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
