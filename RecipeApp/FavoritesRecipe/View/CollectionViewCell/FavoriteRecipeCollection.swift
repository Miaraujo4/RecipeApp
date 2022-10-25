//
//  FavoriteRecipeCollection.swift
//  RecipeApp
//
//  Created by Milena Araujo on 23/10/22.
//

import Foundation
import UIKit

final class FavoriteRecipeCollection: UICollectionViewCell {
    
    // MARK: - Static Propertie
    static let cellIdentifier: String = "favoriteCell"
    
    // MARK: - Private UI Properties
    private var recipeImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var recipeDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.83, green: 0.81, blue: 0.87, alpha: 1.00)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setContraint()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func setHierarchy() {
        self.addSubview(containerView)
        containerView.addSubview(recipeImage)
        containerView.addSubview(recipeDescription)
    }
    
    private func setContraint() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            recipeImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            recipeImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            recipeImage.heightAnchor.constraint(equalToConstant: 90),
            recipeImage.widthAnchor.constraint(equalToConstant: 80),
            
            recipeDescription.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 10),
            recipeDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            recipeDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            recipeDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    // MARK: - Functions
    func setViewModel(viewModel: FavoriteRecipeViewModel) {
        recipeImage.load(url: viewModel.imageRecipe)
        recipeDescription.text = viewModel.nameRecipe
        
    }

}

