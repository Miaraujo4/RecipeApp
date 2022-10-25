//
//  FavoriteRecipeViewController.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import UIKit

protocol FavoriteRecipeViewControllerDelegate: AnyObject {
    func goToDetailSection(recipeDetail: RecipeDetail)
}

final class FavoriteRecipeViewController: UIViewController {

    // MARK: - Private Properties
    private let favoriteView: FavoriteRecipeView = FavoriteRecipeView()
    private let viewModel: FavoriteRecipeViewModel
    
    // MARK: - Init
    init(viewModel: FavoriteRecipeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = favoriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        favoriteView.setViewModel(viewModel: viewModel)
        self.title = "Mis Favoritos"
        self.navigationController?.backButtonEmpty()
    }
}

extension FavoriteRecipeViewController: FavoriteRecipeViewControllerDelegate {
    func goToDetailSection(recipeDetail: RecipeDetail) {
        let viewModel = DetailRecipeViewModel(recipeDetailList: recipeDetail)
        let detailViewController: DetailRecipeViewController = DetailRecipeViewController(viewModel: viewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
