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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()

        self.addSubview(boxImages)
        boxImages.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.addSubview(dontHaveFavoriteLabel)
        dontHaveFavoriteLabel.snp.makeConstraints {
            $0.top.equalTo(boxImages.snp.bottom).offset(25)
            $0.centerX.equalTo(boxImages)
        }
    }
    
    internal func setupFavouritesView( _ setView: FavouritesHaveEnum) {
        switch setView {
        case .have:
            break
        case .dontHave:
            boxImages.isHidden = false
            dontHaveFavoriteLabel.isHidden = false
        }
    }
}
