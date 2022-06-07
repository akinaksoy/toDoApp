//
//  Datepicker.swift
//  toDoApp
//
//  Created by Akın Aksoy on 7.06.2022.
//

import Foundation
import UIKit
struct Datepicker {
    
    let datePicker : UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.backgroundColor = UIColor().setPink2
        datePicker.tintColor = UIColor().setGold
        datePicker.overrideUserInterfaceStyle = .dark
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.contentMode = .left
        datePicker.layer.borderWidth = 3
        datePicker.layer.cornerRadius = 5
        datePicker.layer.borderColor = UIColor().setGold.cgColor
        return datePicker
    }()
    
}
