//
//  ToDo.swift
//  toDoApp
//
//  Created by Akın Aksoy on 9.06.2022.
//

import Foundation

struct ToDo: Codable {
    var title: String = ""
    var description: String = ""
    var date = Date()
    var checkStatus = false
}
