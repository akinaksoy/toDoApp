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
        button.backgroundColor = UIColor().setPurple1
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor().setPink2.cgColor
        button.setTitleColor(UIColor().setWhite1, for: .normal)
        button.setTitle("Save", for: .normal)
        return button
    }()
    
}
