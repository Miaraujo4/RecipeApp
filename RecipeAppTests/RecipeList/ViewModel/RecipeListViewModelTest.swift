//
//  RecipeListViewModelTest.swift
//  RecipeAppTests
//
//  Created by Milena Araujo on 25/10/22.
//

import XCTest
@testable import RecipeApp

class RecipeListViewModelTest: XCTestCase, RecipeListViewControllerDelegate {

    var viewModel: RecipeListViewModel!
    var service: RecipeServiceMock!
    
    override func setUpWithError() throws {
        service = RecipeServiceMock()
        viewModel = RecipeListViewModel(service: service)
        viewModel.delegate = self
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testInitialStateViewModel() {
        XCTAssertTrue(viewModel.recipeName.isEmpty)
        XCTAssertTrue(viewModel.recipeDetailList.isEmpty)
        XCTAssertTrue(viewModel.position == 0)
    }
    
    func testGetRecipeService() {
        service.shouldFailRequest = false
        viewModel.getRecipeList()
        XCTAssertFalse(viewModel.recipeDetailList.isEmpty)
    }
    
    func testGetRecipeServiceWithError() {
        service.shouldFailRequest = true
        XCTAssertTrue(viewModel.recipeDetailList.isEmpty)
    }
    
    func recipesLoaded() {
        let functionCalled: Bool = true
        XCTAssertTrue(functionCalled)
    }
    
    func testeDelegate() {
        viewModel.delegate?.goToDetailSection(recipeDetail: RecipeDetail.mock())
        viewModel.delegate?.goToFavoriteSection(favoriteRecipe: RecipeDetail.mockDetail())
    }
    
    func goToDetailSection(recipeDetail: RecipeDetail) {
        XCTAssertEqual(recipeDetail.title, "Cauliflower, Brown Rice, and Vegetable Fried Rice")
        XCTAssertEqual(recipeDetail.image, "https://spoonacular.com/recipeImages/646903-312x231.jpg")
        XCTAssertEqual(recipeDetail.id, 123)
    }
    
    func goToFavoriteSection(favoriteRecipe: [RecipeDetail]) {
        XCTAssertEqual(favoriteRecipe[0].title, "Cauliflower, Brown Rice, and Vegetable Fried Rice")
        XCTAssertEqual(favoriteRecipe[0].image, "https://spoonacular.com/recipeImages/646903-312x231.jpg")
    }
}
