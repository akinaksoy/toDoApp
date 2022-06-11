//
//  toDoManager.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation

struct toDoManager {
    let Key = "ToDoList"
    static let shared = toDoManager()
    func fetchData() -> [ToDo] {
        guard let encodedData = UserDefaults.standard.array(forKey: Key) as? [Data] else {
            return []
        }
        return encodedData.map { try! JSONDecoder().decode(ToDo.self, from: $0) }
    }
    func save(toDoItem: [ToDo]) {
        let data = toDoItem.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: Key)
    }
    func editData(selectedIndex: Int, toDoItem: [ToDo]) {

        var toDoList = toDoItem
        toDoList.remove(at: selectedIndex)
        let data = toDoList.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: Key)
    }
}
