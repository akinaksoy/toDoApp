//
//  Button.swift
//  toDoApp
//
//  Created by Akın Aksoy on 6.06.2022.
//

import Foundation
import UIKit
struct Button{
    
    public let saveButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor().setWhite1
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor().setPurple2.cgColor
        button.setTitleColor(UIColor().setPurple1, for: .normal)
        button.setTitle("Save", for: .normal)
        return button
    }()
    
}
