//
//  ViewAllAppartmentsView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 7.01.23.
//

import UIKit

class ViewAllAppartmentsView: UIView {
    
    private let collectionView = ViewAllAppartmentsCollectionView()
    internal var getCollectionView: ViewAllAppartmentsCollectionView { collectionView }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
