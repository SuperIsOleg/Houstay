//
//  AdditionsCollectionView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 3.12.22.
//

import UIKit

class AdditionsCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = R.color.lnk5()
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
