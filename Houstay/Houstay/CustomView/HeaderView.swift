//
//  HeaderView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 1.09.22.
//

import UIKit

class HeaderView: UIView {
    
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = R.color.lnk30()
        return imageView
    }()
    
    private let goodMorningLabel: UILabel = {
       let label = UILabel()
        label.text = R.string.localizable.headerGoodMorning()
        label.font = R.font.robotoRegular(size: 12)
        label.textColor = R.color.lnk100()
        return label
    }()
    
    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.text = "No name"
        label.font = R.font.robotoMedium(size: 20)
        label.textColor = R.color.lnk100()
        return label
    }()
    
    private let searchTextField: SearcheTextFieldBase = {
        let textField = SearcheTextFieldBase()

        return textField
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
        
        self.addSubview(photoImage)
        photoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(56)
        }

        self.addSubview(goodMorningLabel)
        goodMorningLabel.snp.makeConstraints {
            $0.top.equalTo(photoImage).offset(5)
            $0.leading.equalTo(photoImage.snp.trailing).offset(12)
        }
        
        self.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(goodMorningLabel.snp.bottom).offset(7)
            $0.leading.equalTo(goodMorningLabel)
        }
        
        self.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(photoImage.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(44)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
    internal func setUserName(userName: String) {
        userNameLabel.text = userName
    }

}
