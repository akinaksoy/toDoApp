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
    func generateDateToString( dateValue : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY - hh.mm"
        return dateFormatter.string(from: dateValue)
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
