//
//  createToDoViewModel.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation
struct createToDoViewModel {
    static let shared = createToDoViewModel()
    func saveDataToStorage(title: String, description: String, date: Date) {
        let toDo = ToDo(title: title, description: description, date: date, checkStatus: false)
        var toDoList = [Any]().toDoListorderByDate

        toDoList.append(toDo)
        toDoManager.shared.save(toDoItem: toDoList)
    }
    func getDataForEdit(index: Int) -> ToDo {
        let toDoList = [Any]().toDoListorderByDate
        return toDoList[index]
    }
    func editDataForStorage(index: Int, title: String, description: String, date: Date) {
        let toDo = ToDo(title: title, description: description, date: date, checkStatus: false)
        var toDoList = [Any]().toDoListorderByDate

        toDoList.append(toDo)
        toDoManager.shared.editData(selectedIndex: index, toDoItem: toDoList)
    }

}
