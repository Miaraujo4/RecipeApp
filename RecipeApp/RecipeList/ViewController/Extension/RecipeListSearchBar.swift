//
//  RecipeListSearchBar.swift
//  RecipeApp
//
//  Created by Milena Araujo on 25/10/22.
//

import Foundation
import UIKit

extension RecipeListViewController {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        configureSearchBarButton()
        viewModel.inSearchMode = false
        recipeView.updateRecipeList()
        viewModel.searchRecipe(recipeName: "")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchRecipe(recipeName: searchBar.text)
        searchBar.endEditing(true)
    }
}
