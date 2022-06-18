//
//  NavigationBar.swift
//  toDoApp
//
//  Created by Akın Aksoy on 18.06.2022.
//

import Foundation
import UIKit

struct NavigationBar {
    func setNavigationBar(textColor : UIColor,backgroundColor : UIColor) -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: textColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: textColor]
        appearance.backgroundColor = backgroundColor
        return appearance
    }
}
