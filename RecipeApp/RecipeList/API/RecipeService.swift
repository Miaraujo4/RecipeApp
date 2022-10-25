//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Milena Araujo on 23/10/22.
//

import Alamofire
import Foundation

protocol RecipeServiceProtocol {
    func getRecipeList(recipeName: String, completionHandler: @escaping(Result<[RecipeDetail], ErrorRequest>) -> Void)
}

final class RecipeService: RecipeServiceProtocol {
    
    let token: String = "ded62405c2e0467e945672876cfaf1ea"
    var recipeInfoList: [RecipeDetail] = [RecipeDetail]()
    
    func getRecipeList(recipeName: String, completionHandler: @escaping(Result<[RecipeDetail], ErrorRequest>) -> Void) {
        recipeInfoList = [RecipeDetail]()
        var urlStr: String = ""
        if recipeName.isEmpty {
            urlStr = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(token)"
        } else {
            urlStr = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(token)&query=\(recipeName)"
        }
        AF.request(urlStr,
                   method: .get).response { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let data: Data = data else {
                        completionHandler(.failure(.requestError))
                        return
                    }
                    let recipeList: RecipeList = try JSONDecoder().decode(RecipeList.self, from: data)
                    self.getRecipeDetail(recipeList: recipeList.results, completionHandler: completionHandler)
                } catch {
                    completionHandler(.failure(.errorDecoding))
                }
            case .failure(_):
                completionHandler(.failure(.requestError))
            }
        }
    }
    
    func getRecipeDetail(recipeList: [Results], completionHandler: @escaping(Result<[RecipeDetail], ErrorRequest>) -> Void) {
        for item in recipeList {
            let id = item.id
            AF.request("https://api.spoonacular.com/recipes/\(id)/information?apiKey=\(token)",
                       method: .get).response { [weak self] response in
                switch response.result {
                case .success(let data):
                    do {
                        guard let data: Data = data else {
                            completionHandler(.failure(.requestError))
                            return
                        }
                        let recipeDetail: RecipeDetail = try JSONDecoder().decode(RecipeDetail.self, from: data)
                        self?.recipeInfoList.append(recipeDetail)
                        if self?.recipeInfoList.count == recipeList.count {
                            completionHandler(.success(self?.recipeInfoList ?? [RecipeDetail]()))
                        }
                    } catch {
                        completionHandler(.failure(.errorDecoding))
                    }
                case .failure(_):
                    completionHandler(.failure(.requestError))
                }
            }
        }
    }
}
