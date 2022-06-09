//
//  toDoListViewModel.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation
struct toDoListViewModel {
    static let shared = toDoListViewModel()
    
    func generateDateToString( dateValue : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY - hh.mm"
        return dateFormatter.string(from: dateValue)
    }
    func getCheckboxImage(checkStatus : Bool) -> String{
        var iconText = ""
        if checkStatus {iconText = "checkmark.square" }
        else {iconText = "square"}
        return iconText
    }
}
