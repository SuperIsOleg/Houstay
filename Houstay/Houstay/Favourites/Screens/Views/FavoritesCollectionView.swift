//
//  FavoritesCollectionView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 27.11.22.
//

import UIKit

class FavoritesCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = R.color.white500()
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
