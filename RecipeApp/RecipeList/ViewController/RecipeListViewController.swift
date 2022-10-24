//
//  ViewController.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import UIKit

protocol GoToNextScreen: AnyObject {
    func goToDetailSection()
    func goToFavoriteSection()
}

final class RecipeListViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Private Properties
    private var recipeView: RecipeListView = RecipeListView()
    private var searchBar: UISearchBar?
    private var viewModel: RecipeListViewModel = RecipeListViewModel()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = recipeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeView.setViewModel(viewModel: viewModel)
        viewModel.delegate = self
        configNavigation()
    }
    
    // MARK: - Functions
    func configNavigation() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "Lista de Recetas"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc
    func showSearchBar() {
        searchBar = UISearchBar()
        searchBar?.delegate = self
        searchBar?.sizeToFit()
        searchBar?.showsCancelButton = true
        searchBar?.becomeFirstResponder()
        searchBar?.tintColor = .white
        
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
    
}

extension RecipeListViewController: GoToNextScreen {
    
    func goToDetailSection() {
        navigationController?.pushViewController(DetailRecipeViewController(), animated: true)
    }
    
    func goToFavoriteSection() {
        let favoriteRecipeViewController: FavoriteRecipeViewController = FavoriteRecipeViewController()
        navigationController?.pushViewController(favoriteRecipeViewController, animated: true)
    }
}

