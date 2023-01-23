//
//  SearchView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.01.23.
//

import UIKit

class SearchView: UIView {
    
    enum SearchView {
        case history
        case result
    }
    
    private let resultCollectionView: ResultCollectionView = {
        let collectionView = ResultCollectionView()
        collectionView.isHidden = true
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()

    }
}

