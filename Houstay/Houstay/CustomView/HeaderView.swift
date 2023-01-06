//
//  HeaderView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 1.09.22.
//

import UIKit

class HeaderView: UIView {
    
    enum TopTitleEnum {
        case favorite
        case news
    }
    
    private let topTitleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoMedium(size: 20)
        label.textColor = R.color.lnk100()
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
        
        self.addSubview(topTitleLabel)
        topTitleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
        }
    }
    
    internal func configureTitle(title: TopTitleEnum) {
        switch title {
        case .favorite:
            topTitleLabel.text = R.string.localizable.favouritesLiked()
        case .news:
            topTitleLabel.text = R.string.localizable.newsNews()
        }
    }
    
}
