//
//  DetailRecipeViewModelTest.swift
//  RecipeAppTests
//
//  Created by Milena Araujo on 25/10/22.
//

import XCTest
@testable import RecipeApp

final class DetailRecipeViewModelTest: XCTestCase {
    
    var viewModel: DetailRecipeViewModel!
    var service: RecipeServiceMock!
    
    override func setUpWithError() throws {
        service = RecipeServiceMock()
        viewModel = DetailRecipeViewModel(recipeDetailList: RecipeDetail.mock())
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testInitialStateViewModel() {
        XCTAssertFalse(viewModel.nameRecipe.isEmpty)
        XCTAssertFalse(viewModel.imageRecipe.isFileURL)
        XCTAssertFalse(viewModel.descriptionRecipe.isEmpty)
    }
}
