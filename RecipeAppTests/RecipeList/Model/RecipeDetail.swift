//
//  RecipeDetail.swift
//  RecipeAppTests
//
//  Created by Milena Araujo on 25/10/22.
//

import Foundation
@testable import RecipeApp

extension RecipeDetail {
    
    static func mock() -> RecipeDetail {
        RecipeDetail(id: 123, title: "Cauliflower, Brown Rice, and Vegetable Fried Rice", image: "https://spoonacular.com/recipeImages/646903-312x231.jpg", summary: "", instructions: "Remove the cauliflower's tough stem and reserve for another use. Using a food processor, pulse cauliflower florets until they resemble rice or couscous. You should end up with around four cups of \"cauliflower rice.\"</li><li>Heat 1T butter and 1T oil in a large skillet over medium heat.")
    }
    
    static func mockDetail() -> [RecipeDetail] {
        [RecipeDetail(id: 123, title: "Cauliflower, Brown Rice, and Vegetable Fried Rice", image: "https://spoonacular.com/recipeImages/646903-312x231.jpg", summary: "", instructions: "Remove the cauliflower's tough stem and reserve for another use. Using a food processor, pulse cauliflower florets until they resemble rice or couscous. You should end up with around four cups of \"cauliflower rice.\"</li><li>Heat 1T butter and 1T oil in a large skillet over medium heat."),
         RecipeDetail(id: 456, title: "Cauliflower, Brown Rice, and Vegetable Fried Rice", image: "https://spoonacular.com/recipeImages/646903-312x231.jpg", summary: "", instructions: "Remove the cauliflower's tough stem and reserve for another use. Using a food processor, pulse cauliflower florets until they resemble rice or couscous. You should end up with around four cups of \"cauliflower rice.\"</li><li>Heat 1T butter and 1T oil in a large skillet over medium heat.")
        ]
    }
}
