//
//  FavouritesViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    private let favouritesView = FavouritesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        
        self.view.backgroundColor = R.color.green100()
        view.addSubview(favouritesView)
        favouritesView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
