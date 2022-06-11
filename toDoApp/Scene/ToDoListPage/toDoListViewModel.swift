//
//  toDoListViewModel.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation
struct toDoListViewModel {
    static let shared = toDoListViewModel()
    let enums = Enums.checkBox.self
    
    func removeDataForStorage(index : Int){
        let toDoList = Array<Any>().toDoListorderByDate
        toDoManager.shared.editData(selectedIndex: index, toDoItem: toDoList)
    }
    func getCheckboxImage(checkStatus : Bool) -> String{
        var iconText = ""
        switch checkStatus {
        case true:
            iconText = enums.checked.rawValue
        case false:
            iconText = enums.unChecked.rawValue
        }
        return iconText
    }
    func changeStatusOfToDoItem (index : Int) {
        var toDoList = Array<Any>().toDoListorderByDate
        var toDo = toDoList[index]
        
        switch toDo.checkStatus {
        case true:
            toDo.checkStatus = false
        case false:
            toDo.checkStatus = true
        }
        
        toDoList.append(toDo)
        toDoManager.shared.editData(selectedIndex: index, toDoItem: toDoList)
    }
}
