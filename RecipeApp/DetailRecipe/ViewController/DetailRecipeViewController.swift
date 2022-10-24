//
//  SearchRecipeViewController.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import UIKit

final class DetailRecipeViewController: UIViewController {

    // MARK: - Private Properties
    private let viewDetailRecipe: DetailRecipeView = DetailRecipeView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = viewDetailRecipe
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalles de la Receta"
        self.navigationController?.backButtonEmpty()
    }
}
