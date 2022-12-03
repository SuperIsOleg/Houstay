//
//  DescriptionView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 28.11.22.
//

import UIKit

class DescriptionView: BasicView {
    private let imagesCollectionView: ImagesCollectionView = {
        let collectionView = ImagesCollectionView()
        return collectionView
    }()
    
    internal var getImagesCollectionView: ImagesCollectionView { imagesCollectionView }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        contentView.addSubview(imagesCollectionView)
        imagesCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
    
}
