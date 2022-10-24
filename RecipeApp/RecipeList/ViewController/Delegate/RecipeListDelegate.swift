//
//  RecipeListDelegate.swift
//  RecipeApp
//
//  Created by Milena Araujo on 22/10/22.
//

import Foundation
import UIKit

final class RecipeListDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Properties
    var viewModel = RecipeListViewModel()
    
    // MARK: - Functions
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view: UIView = UIView()
        let button: UIButton = UIButton()
        view.backgroundColor = UIColor(red: 0.95, green: 0.84, blue: 0.85, alpha: 1.00)
        button.setTitle("Mis favoritos", for: .normal)
        button.backgroundColor = UIColor(red: 0.45, green: 0.55, blue: 0.65, alpha: 1.00)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(favoriteButtonEvent), for: .touchDown)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8.0),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0)
        ])
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.selectionStyle = .none
        }
        viewModel.itemWasSelected(position: indexPath.row)
    }
    
    @objc
    private func favoriteButtonEvent() {
        viewModel.favoriteButtonTapped()
    }
}

