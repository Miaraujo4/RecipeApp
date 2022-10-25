//
//  FavoriteRecipeViewModelTest.swift
//  RecipeAppTests
//
//  Created by Milena Araujo on 25/10/22.
//

import XCTest
@testable import RecipeApp

final class FavoriteRecipeViewModelTest: XCTestCase {
    
    var viewModel: FavoriteRecipeViewModel!
    var service: RecipeServiceMock!

    override func setUpWithError() throws {
        service = RecipeServiceMock()
        viewModel = FavoriteRecipeViewModel(recipeDetailList: RecipeDetail.mockDetail())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testInitialStateViewModel() {
        XCTAssertFalse(viewModel.imageRecipe.isFileURL)
        XCTAssertFalse(viewModel.nameRecipe.isEmpty)

    }

}
