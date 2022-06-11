//
//  createToDoViewModel.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation
struct CreateToDoViewModel {
    static let shared = CreateToDoViewModel()
    func saveDataToStorage(title: String, description: String, date: Date) {
        let toDo = ToDo(title: title, description: description, date: date, checkStatus: false)
        var toDoList = [Any]().toDoListorderByDate

        toDoList.append(toDo)
        ToDoManager.shared.save(toDoItem: toDoList)
    }
    func getDataForEdit(index: Int) -> ToDo {
        let toDoList = [Any]().toDoListorderByDate
        return toDoList[index]
    }
    func editDataForStorage(index: Int, title: String, description: String, date: Date) {
        let toDo = ToDo(title: title, description: description, date: date, checkStatus: false)
        var toDoList = [Any]().toDoListorderByDate

        toDoList.append(toDo)
        ToDoManager.shared.editData(selectedIndex: index, toDoItem: toDoList)
    }

}
