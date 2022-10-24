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
    private var isFavorite : Bool = false
    private var viewModel: RecipeListViewModel?
    
    // MARK: - Private UI Properties
    private var recipeImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var favoriteImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.addTarget(self, action: #selector(favoriteButtonPressed(sender:)), for: .touchUpInside)
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
        accessoryView = favoriteImage
        favoriteImage.tintColor = .red
        self.backgroundColor = UIColor(red: 0.95, green: 0.84, blue: 0.85, alpha: 1.00)
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
        containerView.addSubview(favoriteImage)
        containerView.addSubview(detailLabel)
    }
    
    private func setContraint() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            recipeImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            recipeImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            recipeImage.heightAnchor.constraint(equalToConstant: 130),
            recipeImage.widthAnchor.constraint(equalToConstant: 210),
            
            favoriteImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            favoriteImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            favoriteImage.heightAnchor.constraint(equalToConstant: 25),
            favoriteImage.widthAnchor.constraint(equalToConstant: 25),
            
            detailLabel.topAnchor.constraint(equalTo: recipeDescription.bottomAnchor, constant: 5),
            detailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            detailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            recipeDescription.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 10),
            recipeDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            recipeDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ])
    }
    
    // MARK: - Functions
    func setViewModel(viewModel: RecipeListViewModel) {
        self.viewModel = viewModel
    }
    
    @objc
    func favoriteButtonPressed(sender: UIButton) {
        isFavorite = !isFavorite
        favoriteImage.setImage(UIImage(named: isFavorite ? "heart" : "heartFill"), for: .normal)
        
    }
}
