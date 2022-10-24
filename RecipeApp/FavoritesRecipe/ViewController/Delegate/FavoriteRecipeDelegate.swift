//
//  FavoriteRecipeDelegate.swift
//  RecipeApp
//
//  Created by Milena Araujo on 23/10/22.
//

import Foundation
import UIKit

final class FavoriteRecipeDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Functions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.39, height: 150)
    }
}
