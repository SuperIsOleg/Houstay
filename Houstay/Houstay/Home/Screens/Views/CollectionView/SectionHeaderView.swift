//
//  SectionHeaderView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 7.01.23.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    static var reuseIdentifier = String(describing: SectionHeaderView.self)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoMedium(size: 20)
        return label
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(R.color.blue80(), for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.setTitle(R.string.localizable.collectionViewViewAll(), for: .normal)
        return button
    }()
    
    internal var closure: (() -> Void)?
    
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
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        self.addSubview(viewAllButton)
        viewAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel)
            $0.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(16)
        }
        
        viewAllButton.addTarget(self, action: #selector(showAllAppartmentsTap), for: .touchUpInside)
    }
    
    internal func setTitle(configure: ConfigureSectionTitle) {
        switch configure {
        case .allAppartments:
            return self.titleLabel.text = R.string.localizable.collectionViewAllAppartments()
        case .popular:
            return self.titleLabel.text = R.string.localizable.collectionViewPopular()
        case .recentlyPosted:
            return self.titleLabel.text = R.string.localizable.collectionViewRecentlyPosted()
        }
    }
    
    @objc
    private func showAllAppartmentsTap() {
        closure?()
    }
    
}
