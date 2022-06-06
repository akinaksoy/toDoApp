//
//  textField.swift
//  toDoApp
//
//  Created by Akın Aksoy on 6.06.2022.
//

import Foundation
import UIKit
struct TextField {
    
    public let textfield : UITextField = {
       let textfield = UITextField()
        textfield.backgroundColor = UIColor().setPink2
        textfield.textColor = UIColor().setWhite1
        textfield.textAlignment = .left
        return textfield
    }()
    
}
