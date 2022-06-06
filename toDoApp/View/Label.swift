//
//  Label.swift
//  toDoApp
//
//  Created by Akın Aksoy on 6.06.2022.
//

import Foundation
import UIKit

struct Label {
    
    public let headerLabel : UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor().setWhite1
        return label
    }()
    public let descriptionLabel : UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 8)
        label.textColor = UIColor().setWhite2
        return label
    }()
    
}
