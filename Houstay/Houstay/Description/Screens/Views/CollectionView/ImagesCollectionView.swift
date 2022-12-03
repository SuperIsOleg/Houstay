//
//  ImagesCollectionView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 3.12.22.
//

import UIKit

class ImagesCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = R.color.white500()
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
