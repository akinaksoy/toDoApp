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
    
    func getOrderedListbyDate() -> [ToDo] {
        let toDoList = toDoManager.shared.fetchData()
        return toDoList.sorted(by: { ($0.date) <= ($1.date)})
    }
    func removeDataForStorage(index : Int){
        let toDoList = getOrderedListbyDate()
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
}
