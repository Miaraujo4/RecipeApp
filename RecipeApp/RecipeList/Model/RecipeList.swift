//
//  RecipeList.swift
//  RecipeApp
//
//  Created by Milena Araujo on 23/10/22.
//

import Foundation

struct RecipeList: Codable {
    let results: [Results]
    let offset, number, totalResults: Int
}

struct Results: Codable, Equatable {
    let id: Int
    let title: String
    let image: String
    let imageType: ImageType
}

enum ImageType: String, Codable {
    case jpg = "jpg"
}

