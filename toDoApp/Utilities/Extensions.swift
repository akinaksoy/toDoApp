//
//  Extensions.swift
//  toDoApp
//
//  Created by Akın Aksoy on 6.06.2022.
//

import Foundation
import UIKit

extension UIColor {
    var setPink1 : UIColor {
        if let color = UIColor(named: "pink-1") {
            return color
        }else{
            return .systemPink
        }
    }
    var setPink2 : UIColor {
        if let color = UIColor(named: "pink-2") {
            return color
        }else{
            return .systemPink
        }
    }
    var setPurple1 : UIColor {
        if let color = UIColor(named: "purple-1") {
            return color
        }else{
            return .purple
        }
    }
    var setPurple2 : UIColor {
        if let color = UIColor(named: "purple-2") {
            return color
        }else{
            return .purple
        }
    }
    var setWhite1 : UIColor {
        if let color = UIColor(named: "white-1") {
            return color
        }else{
            return .white
        }
    }
    var setWhite2 : UIColor {
        if let color = UIColor(named: "white-2") {
            return color
        }else{
            return .white
        }
    }
    var setGold : UIColor {
        if let color = UIColor(named: "gold") {
            return color
        }else{
            return .white
        }
    }
}

