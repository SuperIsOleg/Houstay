//
//  HomeCollectionView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 7.01.23.
//

import UIKit

class HomeCollectionView: UICollectionView {

    init() {
        super.init(frame: .zero,collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
