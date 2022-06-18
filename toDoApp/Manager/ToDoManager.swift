//
//  toDoManager.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation

struct ToDoManager {
    let toDoKey = "ToDoList"
    static let shared = ToDoManager()
    func fetchData() -> [ToDo] {
        let toDoList : [ToDo] = [ToDo]()
        guard let encodedData = UserDefaults.standard.array(forKey: toDoKey) as? [Data] else {
            return []
        }
        return encodedData.map {
            do {
                let encoded = try JSONDecoder().decode(ToDo.self, from: $0)
                return encoded
            } catch {
                return toDoList[0]
            }
         }
    }
    func save(toDoItem: [ToDo]) {
        let data = toDoItem.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: toDoKey)
    }
    func editData(selectedIndex: Int, toDoItem: [ToDo]) {

        var toDoList = toDoItem
        toDoList.remove(at: selectedIndex)
        let data = toDoList.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: toDoKey)
    }
}
