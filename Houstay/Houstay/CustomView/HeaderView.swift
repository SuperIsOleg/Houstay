//
//  HeaderView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 1.09.22.
//

import UIKit

protocol HeaderViewDelegate {
    func exitAction()
}

class HeaderView: UIView {
    
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = R.color.lnk10()
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
    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = R.color.blue100()?.cgColor
        button.setTitle("Выйти", for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.setTitleColor(R.color.blue100(), for: .normal)
        button.backgroundColor = R.color.white500()
        return button
    }()
    
    internal var headerViewDelegate: HeaderViewDelegate?

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
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(48)
        }
        
        self.addSubview(exitButton)
        exitButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(photoImage)
            $0.height.equalTo(30)
            $0.width.equalTo(77)
        }
        
        self.addSubview(goodMorningLabel)
        goodMorningLabel.snp.makeConstraints {
            $0.top.equalTo(photoImage).offset(2)
            $0.leading.equalTo(photoImage.snp.trailing).offset(12)
        }
        
        self.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(photoImage).offset(-2)
            $0.leading.equalTo(goodMorningLabel)
            $0.trailing.equalTo(exitButton.snp.leading).offset(-10)
        }
        
        self.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(photoImage.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(44)
        }

        exitButton.addTarget(self, action: #selector(exitTap), for: .touchUpInside)
    }
    
    internal func setUserName(userName: String) {
        userNameLabel.text = userName
    }
    
    @objc func exitTap() {
        headerViewDelegate?.exitAction()
    }

}
