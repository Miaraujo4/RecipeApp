//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation
import UIKit

final class RecipeListView: UIView {
    
    // MARK: - Private Properties
    private var dataSource: RecipeListDataSource = RecipeListDataSource()
    private var delegate: RecipeListDelegate = RecipeListDelegate()
    
    // MARK: - Private UI Properties
    private var recipeList: UITableView = {
        let tableView = UITableView()
        tableView.register(RecipeListTableViewCell.self,
                           forCellReuseIdentifier: RecipeListTableViewCell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setHierarchy()
        setConstraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func setHierarchy() {
        self.addSubview(recipeList)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            recipeList.topAnchor.constraint(equalTo: self.topAnchor),
            recipeList.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            recipeList.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            recipeList.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
     func setViewModel(viewModel: RecipeListViewModel) {
        delegate.viewModel = viewModel
        dataSource.viewModel = viewModel
        recipeList.dataSource = dataSource
        recipeList.delegate = delegate
    }
}
