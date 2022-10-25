//
//  FavoriteRecipeView.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation
import UIKit

final class FavoriteRecipeView: UIView {
    
    // MARK: - Private Properties
    private var dataSource: FavoriteRecipeDataSource = FavoriteRecipeDataSource()
    private var delegate: FavoriteRecipeDelegate = FavoriteRecipeDelegate()
 
    // MARK: - Private UI Properties
    private var favoriteRecipeCollection: UICollectionView = {
        let collectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.sectionInset = UIEdgeInsets(top: 5, left: 28, bottom: 2, right: 28)
        collectionLayout.minimumLineSpacing = 8
        collectionLayout.minimumInteritemSpacing = 10
        let colleticonView: UICollectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionLayout
        )
        colleticonView.register(FavoriteRecipeCollection.self,
                                forCellWithReuseIdentifier: FavoriteRecipeCollection.cellIdentifier)
        colleticonView.translatesAutoresizingMaskIntoConstraints = false
        colleticonView.backgroundColor = UIColor(red: 0.95, green: 0.84, blue: 0.85, alpha: 1.00)
        return colleticonView
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setHierarchy()
        setContraint()
        self.backgroundColor = UIColor(red: 0.95, green: 0.84, blue: 0.85, alpha: 1.00)
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func setHierarchy() {
        self.addSubview(favoriteRecipeCollection)
    }
    
    private func setContraint() {
        NSLayoutConstraint.activate([
            favoriteRecipeCollection.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            favoriteRecipeCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            favoriteRecipeCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            favoriteRecipeCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: - Functions
    func setViewModel(viewModel: FavoriteRecipeViewModel) {
        dataSource.viewModel = viewModel
        delegate.viewModel = viewModel
        favoriteRecipeCollection.dataSource = dataSource
        favoriteRecipeCollection.delegate = delegate
        favoriteRecipeCollection.reloadData()
    }
}
