//
//  toDoListViewModel.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation
struct ToDoListViewModel {
    static let shared = ToDoListViewModel()
    let enums = Enums.CheckBox.self

    func removeDataForStorage(index: Int) {
        let toDoList = [Any]().toDoListorderByDate
        ToDoManager.shared.editData(selectedIndex: index, toDoItem: toDoList)
    }
    func getCheckboxImage(checkStatus: Bool) -> String {
        var iconText = ""
        switch checkStatus {
        case true:
            iconText = enums.checked.rawValue
        case false:
            iconText = enums.unChecked.rawValue
        }
        return iconText
    }
    func changeStatusOfToDoItem (index: Int) {
        var toDoList = [Any]().toDoListorderByDate
        var toDo = toDoList[index]

        switch toDo.checkStatus {
        case true:
            toDo.checkStatus = false
        case false:
            toDo.checkStatus = true
        }

        toDoList.append(toDo)
        ToDoManager.shared.editData(selectedIndex: index, toDoItem: toDoList)
    }
    func getDoneRatio() -> String {
        let toDoList = [Any]().toDoListorderByDate
        let toDoListElementCount = toDoList.count
        var doneCount = 0
        for item in toDoList where item.checkStatus == true {
            doneCount += 1
        }
        let doneRatio = Int((Float(doneCount)/Float(toDoListElementCount))*100)
        return String("%\(doneRatio)")
    }
}
