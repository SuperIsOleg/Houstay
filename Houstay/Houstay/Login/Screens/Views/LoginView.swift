//
//  LoginView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

class LoginView: UIView {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.logo()
        return imageView
    }()
    
    private let logoLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizable.loginTitle()
        label.font = R.font.robotoMedium(size: 24)
        label.textColor = R.color.blue100()
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
        self.addSubview(logoImage)
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(90)
        }
        
        self.addSubview(logoLabel)
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
    }
}
