//
//  UserAuthenticationView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 11.11.22.
//

import UIKit

protocol UserAuthenticationDeleagte: AnyObject {
    func logInAction()
}

class UserAuthenticationView: UIView {
    
    private let noAuthenticationViewImages: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.authUser()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let authRequiredLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.userAuthenticationAuthorizationRequired()
        label.font = R.font.robotoMedium(size: 20)
        label.textColor = R.color.lnk100()
        return label
    }()
    
    private let needToLoggedlabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.userAuthenticationNeedToLogged()
        label.font = R.font.robotoMedium(size: 16)
        label.textColor = R.color.lnk50()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = R.color.blue100()
        button.setTitle(R.string.localizable.loginLogin(), for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.titleLabel?.textColor = R.color.white500()
        return button
    }()
    
    internal weak var userAuthenticationDeleagte: UserAuthenticationDeleagte?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        self.addSubview(noAuthenticationViewImages)
        noAuthenticationViewImages.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.centerX.equalToSuperview()
        }
        
        self.addSubview(authRequiredLabel)
        authRequiredLabel.snp.makeConstraints {
            $0.top.equalTo(noAuthenticationViewImages.snp.bottom).offset(38)
            $0.centerX.equalTo(noAuthenticationViewImages)
        }
        
        self.addSubview(needToLoggedlabel)
        needToLoggedlabel.snp.makeConstraints {
            $0.top.equalTo(authRequiredLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
        
        self.addSubview(logInButton)
        logInButton.snp.makeConstraints {
            $0.top.equalTo(needToLoggedlabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        
        logInButton.addTarget(self, action: #selector(logInTap), for: .touchUpInside)
    }
    
    @objc
    private func logInTap() {
        userAuthenticationDeleagte?.logInAction()
    }
    
}
