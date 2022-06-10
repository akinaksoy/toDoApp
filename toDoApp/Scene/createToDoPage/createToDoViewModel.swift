//
//  createToDoViewModel.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation
struct createToDoViewModel {
    static let shared = createToDoViewModel()
    func saveDataToStorage(title : String,description: String,date : Date){
        let toDo = ToDo(id: UUID(),title: title, description: description, date: date, checkStatus: false)
        var toDoList = orderListbyDate()
        
        toDoList.append(toDo)
        toDoManager.shared.save(toDoItem: toDoList)
    }
    func getDataForEdit(index : Int) -> ToDo{
        let toDoList = orderListbyDate()
        return toDoList[index]
    }
    func editDataForStorage(index : Int,title : String,description: String,date : Date){
        let toDo = ToDo(id: UUID(),title: title, description: description, date: date, checkStatus: false)
        var toDoList = orderListbyDate()
        
        toDoList.append(toDo)
        toDoManager.shared.editData(selectedIndex: index, toDoItem: toDoList)
    }
    func orderListbyDate() -> [ToDo] {
        let toDoList = toDoManager.shared.fetchData()
        return toDoList.sorted(by: { ($0.date) <= ($1.date)})
    }
}
