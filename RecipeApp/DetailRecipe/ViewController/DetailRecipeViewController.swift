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
    private var viewModel: DetailRecipeViewModel
    
    // MARK: - Init
    init(viewModel: DetailRecipeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = viewDetailRecipe
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetailRecipe.setViewModel(viewModel: viewModel)
        self.title = "Detalles de la Receta"
        self.navigationController?.backButtonEmpty()
    }
}
