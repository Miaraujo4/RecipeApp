//
//  FavoriteRecipeViewController.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import UIKit

final class FavoriteRecipeViewController: UIViewController {

    // MARK: - Private Properties
    private let favoriteView: FavoriteRecipeView = FavoriteRecipeView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = favoriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteView.setViewModel()
        self.title = "Mis Favoritos"
        self.navigationController?.backButtonEmpty()
    }
}
