//
//  SplashViewController.swift
//  RecipeApp
//
//  Created by Milena Araujo on 25/10/22.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    var lottieAnimation: LottieAnimationView = LottieAnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        lottieAnimation.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lottieAnimation)
        NSLayoutConstraint.activate([
            lottieAnimation.topAnchor.constraint(equalTo: self.view.topAnchor),
            lottieAnimation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            lottieAnimation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            lottieAnimation.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        lottieAnimation.animation = LottieAnimation.named("foodCarousel")
        lottieAnimation.play { didFinished in
            let RecipeListViewController = RecipeListViewController()
            self.navigationController?.pushViewController(RecipeListViewController, animated: true)
        }
    }

}
