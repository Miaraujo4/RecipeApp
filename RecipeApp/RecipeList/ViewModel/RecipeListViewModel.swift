//
//  RecipeListViewModel.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation
import UIKit

final class RecipeListViewModel {
    
    // MARK: - Properties
    weak var delegate: GoToNextScreen?
    
    // MARK: - Functions
    func itemWasSelected(position: Int) {
        delegate?.goToDetailSection()
    }
    
    func favoriteButtonTapped() {
        delegate?.goToFavoriteSection()
    }
}
