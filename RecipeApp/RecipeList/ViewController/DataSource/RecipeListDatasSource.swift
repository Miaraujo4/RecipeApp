//
//  RecipeListDataSource.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation
import UIKit

final class RecipeListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    var viewModel: RecipeListViewModel = RecipeListViewModel()
    
    // MARK: - Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RecipeListTableViewCell = tableView.dequeueReusableCell(withIdentifier: RecipeListTableViewCell.cellIdentifier, for: indexPath) as? RecipeListTableViewCell else {
            return UITableViewCell()
        }
        cell.setViewModel(viewModel: viewModel)
        return cell
    }
}
