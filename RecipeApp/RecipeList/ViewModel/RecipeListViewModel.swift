//
//  RecipeListViewModel.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation
import UIKit

final class RecipeListViewModel {
    
    // MARK: - Properties
    weak var delegate: RecipeListViewControllerDelegate?
    var recipeDetailList: [RecipeDetail] = [RecipeDetail]()
    var service: RecipeServiceProtocol
    var position: Int = 0
    var filteredRecipe: [RecipeDetail] = [RecipeDetail]()
    var inSearchMode = false
    
    init(service: RecipeServiceProtocol = RecipeService() ) {
        self.service = service
    }
    
    // MARK: - Computed Properties
    var recipeName: String {
        guard recipeDetailList.indices.contains(position) else {
            return ""
        }
        return recipeDetailList[position].title ?? ""
    }
    
    var recipeImage: URL {
        guard recipeDetailList.indices.contains(position),
              let url = URL(string: recipeDetailList[position].image ?? "") else {
            return URL(fileURLWithPath: "")
        }
        return url
    }
    
    var favoriteImage: String {
        guard let isFavorite: Bool = recipeDetailList[position].isFavorite else {
            return "heart"
        }
        return isFavorite ? "heartFill" : "heart"
    }
    
    // MARK: - Functions
    func itemWasSelected(position: Int) {
        delegate?.goToDetailSection(recipeDetail: recipeDetailList[position])
    }
    
    func setRecipeAsFavorite(position: Int) -> String {
        recipeDetailList[position].isFavorite = !(recipeDetailList[position].isFavorite ?? false)
        guard let isFavorite: Bool = recipeDetailList[position].isFavorite else {
            return "heart"
        }
        return isFavorite ? "heartFill" : "heart"
    }
    
    func favoriteButtonTapped() {
        let favoriteRecipes: [RecipeDetail] = recipeDetailList.filter { recipe in
            return recipe.isFavorite ?? false
        }
        delegate?.goToFavoriteSection(favoriteRecipe: favoriteRecipes)
    }
    
    func searchRecipe(recipeName: String?) {
        guard let recipeName: String = recipeName else {
            return
        }
        getRecipeList(recipeName: recipeName)
    }
    
    func getRecipeList(recipeName: String = "") {
        service.getRecipeList(recipeName: recipeName) { [weak self] result in
            switch result {
            case .success(let recipeList):
                self?.recipeDetailList = recipeList
                self?.delegate?.recipesLoaded()
            case .failure(let error):
                self?.handleError(error: error)
            }
        }
    }
    
    func handleError(error: ErrorRequest) {
        switch error {
        case .errorDecoding:
            print("Decoding not work")
        case .requestError:
            print("Service problem")
        }
    }
}
