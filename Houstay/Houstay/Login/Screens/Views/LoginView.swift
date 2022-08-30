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
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        return textField
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
        
        self.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        self.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        self.addSubview(logInButton)
        logInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        
    }
}
