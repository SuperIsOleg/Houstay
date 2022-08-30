//
//  OnboardingCollectionView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.08.22.
//

import UIKit
import SnapKit

class OnboardingCollectionView: UICollectionView {
    private let layout = UICollectionViewFlowLayout()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        contentInset = .zero
        showsHorizontalScrollIndicator = false
        register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
