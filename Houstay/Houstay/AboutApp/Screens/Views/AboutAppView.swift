//
//  AboutAppView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 22.09.22.
//

import UIKit

class AboutAppView: BasicView {
    
    private let aboutAppImages: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.aboutApp()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "\(R.string.localizable.aboutAppVersion()) \(Bundle.main.appVersionShort)"
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.white100()
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
        contentView.backgroundColor = R.color.white500()
        
        contentView.addSubview(aboutAppImages)
        aboutAppImages.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(versionLabel)
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(aboutAppImages.snp.bottom).offset(25)
            $0.centerX.equalTo(aboutAppImages)
        }
    }
   
}
