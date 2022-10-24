//
//  UINavigationControllerExt.swift
//  RecipeApp
//
//  Created by Milena Araujo on 23/10/22.
//

import UIKit

extension UINavigationController {
    
    func backButtonEmpty() {
        let button: UIBarButtonItem = UIBarButtonItem()
        button.title = String()
        self.navigationBar.topItem?.backBarButtonItem = button
    }
}
