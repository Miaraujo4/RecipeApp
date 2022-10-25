//
//  RecipeServiceMock.swift
//  RecipeAppTests
//
//  Created by Milena Araujo on 25/10/22.
//

import Foundation
@testable import RecipeApp

class RecipeServiceMock: RecipeServiceProtocol {
    
    var shouldFailRequest: Bool = false
    
    func getRecipeList(recipeName: String, completionHandler: @escaping (Result<[RecipeDetail], ErrorRequest>) -> Void) {
        if shouldFailRequest {
            completionHandler(.failure(.errorDecoding))
        }
        completionHandler(.success(RecipeDetail.mockDetail()))
        
    }
    
    
}
