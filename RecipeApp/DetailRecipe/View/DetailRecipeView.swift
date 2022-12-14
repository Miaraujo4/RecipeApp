//
//  DetailRecipeView.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation
import UIKit

final class DetailRecipeView: UIView {
    
    // MARK: - Private UI Properties
    private var imageDetailRecipe: UIImageView = {
        let image: UIImageView = UIImageView()
        image.backgroundColor = UIColor(red: 0.83, green: 0.81, blue: 0.87, alpha: 1.00)
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var nameDetailRecipe: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descripcionDetailRecipe: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = true
        view.alwaysBounceVertical = true
        return view
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.95, green: 0.84, blue: 0.85, alpha: 1.00)
        setHierarchy()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func setHierarchy() {
        self.addSubview(scrollView)
        [imageDetailRecipe, nameDetailRecipe,
         descripcionDetailRecipe].forEach { view in
            scrollView.addSubview(view)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageDetailRecipe.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            imageDetailRecipe.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageDetailRecipe.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            imageDetailRecipe.heightAnchor.constraint(equalToConstant: 200),
            
            nameDetailRecipe.topAnchor.constraint(equalTo: imageDetailRecipe.bottomAnchor, constant: 40),
            nameDetailRecipe.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            nameDetailRecipe.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            descripcionDetailRecipe.topAnchor.constraint(equalTo: nameDetailRecipe.bottomAnchor, constant: 20),
            descripcionDetailRecipe.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descripcionDetailRecipe.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90),
            descripcionDetailRecipe.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
        ])
    }
    
    // MARK: - Private Functions
    func setViewModel(viewModel: DetailRecipeViewModel) {
        imageDetailRecipe.load(url: viewModel.imageRecipe)
        descripcionDetailRecipe.text = viewModel.descriptionRecipe
        nameDetailRecipe.text = viewModel.nameRecipe
    }
}
