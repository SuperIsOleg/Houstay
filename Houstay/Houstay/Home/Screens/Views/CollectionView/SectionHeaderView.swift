//
//  SectionHeaderView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 7.01.23.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    static var reuseIdentifier = String(describing: SectionHeaderView.self)
    
    enum ConfigureTitle: String {
        case allAppartments
        case popular
        case recentlyPosted
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoMedium(size: 20)
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
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    internal func setTitle(configure: ConfigureTitle) {
        switch configure {
        case .allAppartments:
            return self.titleLabel.text = R.string.localizable.collectionViewAllAppartments()
        case .popular:
            return self.titleLabel.text = R.string.localizable.collectionViewPopular()
        case .recentlyPosted:
            return self.titleLabel.text = R.string.localizable.collectionViewRecentlyPosted()
        }
    }
    
}
