//
//  OnboardingCollectionViewCell.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.08.22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    public static var identifier = String(describing: OnboardingCollectionViewCell.self)
    
    private let onboardingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = R.image.onboarding1()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.onboarding1Title()
        label.font = R.font.robotoMedium(size: 24)
        label.textColor = R.color.white500()
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.onboarding1Description()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.white500()
        label.numberOfLines = 0
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
        self.addSubview(onboardingImage)
        onboardingImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        onboardingImage.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-120)
            $0.bottom.equalToSuperview().offset(-150)
        }
        
        onboardingImage.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-160)
        }
        
    }
    
    internal func configure(_ onboardingModel: OnboardingModel) {
        self.onboardingImage.image = onboardingModel.image
        self.titleLabel.text = onboardingModel.title
        self.descriptionLabel.text = onboardingModel.description
    }
}
