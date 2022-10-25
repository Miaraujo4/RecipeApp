//
//  ViewController.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import UIKit

protocol RecipeListViewControllerDelegate: AnyObject {
    func recipesLoaded()
    func goToDetailSection(recipeDetail: RecipeDetail)
    func goToFavoriteSection(favoriteRecipe: [RecipeDetail])
}

final class RecipeListViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Private Properties
    private(set) var recipeView: RecipeListView = RecipeListView()
    private var searchBar: UISearchBar?
    private(set) var viewModel: RecipeListViewModel = RecipeListViewModel()
    
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = recipeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getRecipeList()
        recipeView.setViewModel(viewModel: viewModel)
        viewModel.delegate = self
        configNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - Functions
    func configNavigation() {
        self.navigationItem.title = "Lista de Recetas"
        configureSearchBarButton()
    }
    
    func configureSearchBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc
    func showSearchBar() {
        searchBar = UISearchBar()
        searchBar?.delegate = self
        searchBar?.sizeToFit()
        searchBar?.showsCancelButton = true
        searchBar?.becomeFirstResponder()
        searchBar?.tintColor = .black
        
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
    
}

extension RecipeListViewController: RecipeListViewControllerDelegate {
    
    func goToDetailSection(recipeDetail: RecipeDetail) {
        let viewModel = DetailRecipeViewModel(recipeDetailList: recipeDetail)
        let detailViewController: DetailRecipeViewController = DetailRecipeViewController(viewModel: viewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func goToFavoriteSection(favoriteRecipe: [RecipeDetail]) {
        let viewModel = FavoriteRecipeViewModel(recipeDetailList: favoriteRecipe)
        let favoriteRecipeViewController: FavoriteRecipeViewController = FavoriteRecipeViewController(viewModel: viewModel)
        navigationController?.pushViewController(favoriteRecipeViewController, animated: true)
    }
    
    func recipesLoaded() {
        recipeView.updateRecipeList()
    }
}

