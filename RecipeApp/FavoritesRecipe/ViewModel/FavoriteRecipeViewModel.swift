//
//  FavoriteRecipeViewModel.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation

final class FavoriteRecipeViewModel {
    
    // MARK: - Properties
    private(set) var recipeDetailList: [RecipeDetail]
    private(set) var position: Int = 0
    
    weak var delegate: FavoriteRecipeViewControllerDelegate?
    
    // MARK: - Init
    init(recipeDetailList: [RecipeDetail] = [RecipeDetail]()) {
        self.recipeDetailList = recipeDetailList
    }
    
    // MARK: - Computed Properties
    var imageRecipe: URL {
        guard let urlStr: String = recipeDetailList[position].image,
              let url: URL = URL(string: urlStr) else {
            return URL(fileURLWithPath: "")
        }
        return url
    }
    
    var nameRecipe: String {
        guard recipeDetailList.indices.contains(position) else {
            return ""
        }
        return recipeDetailList[position].title
    }
    
    // MARK: - Functions
    func favoriteSelected(position: Int) {
        delegate?.goToDetailSection(recipeDetail: recipeDetailList[position])
    }
}
