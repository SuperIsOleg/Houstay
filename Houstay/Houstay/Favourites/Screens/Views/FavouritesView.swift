//
//  FavouritesView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class FavouritesView: UIView {
    
    enum FavouritesHaveEnum {
        case have
        case dontHave
    }
    
    private let headerView = HeaderView()
    
    private let favoritesCollectionView: FavoritesCollectionView = {
        let collectionView = FavoritesCollectionView()
        collectionView.isHidden = true
        return collectionView
    }()

    private let boxImages: UIImageView = {
       let imageView = UIImageView()
        imageView.image = R.image.box()
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = true
        return imageView
    }()
    
    private let dontHaveFavoriteLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizable.favouritesDontHaveFavorite()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.lnk50()
        label.isHidden = true
        return label
    }()
    
    internal var getFavoritesCollectionView: FavoritesCollectionView { favoritesCollectionView }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        self.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        headerView.configureTitle(title: .favorite)
        
        self.addSubview(favoritesCollectionView)
        favoritesCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        self.addSubview(boxImages)
        boxImages.snp.makeConstraints {
            $0.top.equalToSuperview().offset(160)
            $0.centerX.equalToSuperview()
        }
        
        self.addSubview(dontHaveFavoriteLabel)
        dontHaveFavoriteLabel.snp.makeConstraints {
            $0.top.equalTo(boxImages.snp.bottom).offset(25)
            $0.centerX.equalTo(boxImages)
        }
    }
    
    internal func setupFavoritesView( _ setView: FavouritesHaveEnum) {
        switch setView {
        case .have:
            favoritesCollectionView.isHidden = false
            
            boxImages.isHidden = true
            dontHaveFavoriteLabel.isHidden = true
        case .dontHave:
            boxImages.isHidden = false
            dontHaveFavoriteLabel.isHidden = false
            
            favoritesCollectionView.isHidden = true
        }
    }
}


