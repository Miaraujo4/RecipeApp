//
//  FavoriteRecipeDataSource.swift
//  RecipeApp
//
//  Created by Milena Araujo on 23/10/22.
//

import Foundation
import UIKit

final class FavoriteRecipeDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: FavoriteRecipeCollection = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteRecipeCollection.cellIdentifier, for: indexPath) as? FavoriteRecipeCollection else {
            return UICollectionViewCell()
        }
        return cell
    }
}
