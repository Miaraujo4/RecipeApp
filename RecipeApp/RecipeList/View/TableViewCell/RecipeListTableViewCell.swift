//
//  RecipeListTableViewCell.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation
import UIKit

final class RecipeListTableViewCell: UITableViewCell {
    
    // MARK: - Static Propertie
    static let cellIdentifier: String = "recipeCell"
    
    // MARK: - Private Properties
    private var position: Int = 0
    private var viewModel: RecipeListViewModel?
    
    // MARK: - Private UI Properties
    private var recipeImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var recipeDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Detalles →"
        label.textColor = .black
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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 0.95, green: 0.84, blue: 0.85, alpha: 1.00)
        setHierarchy()
        setContraint()
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchDown)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func setHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(recipeImage)
        containerView.addSubview(recipeDescription)
        containerView.addSubview(detailLabel)
        containerView.addSubview(favoriteButton)
    }
    
    private func setContraint() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            recipeImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            recipeImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            recipeImage.heightAnchor.constraint(equalToConstant: 130),
            recipeImage.widthAnchor.constraint(equalToConstant: 210),
            
            detailLabel.topAnchor.constraint(equalTo: recipeDescription.bottomAnchor, constant: 5),
            detailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            detailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            recipeDescription.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 10),
            recipeDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            recipeDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    // MARK: - Functions
    func setViewModel(viewModel: RecipeListViewModel, position: Int) {
        self.position = position
        self.viewModel = viewModel
        recipeDescription.text = viewModel.recipeName
        recipeImage.load(url: viewModel.recipeImage)
        favoriteButton.setImage(UIImage(named: viewModel.favoriteImage), for: .normal)
    }
    
    @objc
    func favoriteButtonPressed() {
        let favoriteImag: String = viewModel?.setRecipeAsFavorite(position: position) ?? "heart"
        favoriteButton.setImage(UIImage(named: favoriteImag), for: .normal)
    }
}
