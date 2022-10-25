//
//  RecipeDetail.swift
//  RecipeApp
//
//  Created by Milena Araujo on 23/10/22.
//

import Foundation

struct RecipeDetail: Decodable {
    let id: Int
    let title: String
    let image: String?
    let summary: String?
    let instructions: String?
    var isFavorite: Bool? = false
}
