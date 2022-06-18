//
//  textField.swift
//  toDoApp
//
//  Created by Akın Aksoy on 6.06.2022.
//

import Foundation
import UIKit
struct TextField {

    public var textfield: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = UIColor().setPink2
        textfield.textColor = UIColor().setWhite1
        textfield.textAlignment = .center
        textfield.font = .boldSystemFont(ofSize: 18)
        textfield.layer.borderWidth = 3
        textfield.layer.cornerRadius = 5
        textfield.layer.borderColor = UIColor().setGold.cgColor
        return textfield
    }()

}
