//
//  PolicyAndPrivacyView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class PolicyAndPrivacyView: BasicView {
    
    private let policyAndPrivacyImages: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.policyAndPrivacyImage()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.backgroundColor = R.color.white500()
        
        contentView.addSubview(policyAndPrivacyImages)
        policyAndPrivacyImages.snp.makeConstraints {
            $0.top.equalToSuperview().offset(38)
            $0.centerX.equalToSuperview()
        }

    }
   
}
