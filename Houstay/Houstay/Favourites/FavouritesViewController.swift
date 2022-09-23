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
        self.navigationController?.navigationBar.topItem?.title = R.string.localizable.favouritesLiked()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupLayout() {
        favouritesView.setupFavouritesView(.dontHave)
        
        view.addSubview(favouritesView)
        favouritesView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
