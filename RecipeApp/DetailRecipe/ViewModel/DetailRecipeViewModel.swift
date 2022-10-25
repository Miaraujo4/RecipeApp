//
//  DetailRecipeViewModel.swift
//  RecipeApp
//
//  Created by Milena Araujo on 24/10/22.
//

import Foundation

final class DetailRecipeViewModel {
    
    // MARK: - Properties
    var recipeDetailList: RecipeDetail
    
    // MARK: - Init
    init(recipeDetailList: RecipeDetail) {
        self.recipeDetailList = recipeDetailList
    }
    
    // MARK: - Computed Properties
    var imageRecipe: URL {
        let url = URL(string: recipeDetailList.image ?? "") ?? URL(fileURLWithPath: "")
        return url
    }
    
    var descriptionRecipe: String {
        let instructions = recipeDetailList.instructions?
            .replacingOccurrences(of: "</li><li>", with: "")
            .replacingOccurrences(of: "</li></ol>", with: "")
            .replacingOccurrences(of: "<ol><li>", with: "")
            .replacingOccurrences(of: "<span></span>", with: "")
            .replacingOccurrences(of: "<p>", with: "")
            .replacingOccurrences(of: "</p>", with: "")
        if (instructions == nil) {
            return recipeDetailList.summary ?? ""
        }
        return instructions ?? ""
    }
    
    var nameRecipe: String {
        return recipeDetailList.title 
    }
}
