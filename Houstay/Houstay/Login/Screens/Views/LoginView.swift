//
//  LoginView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

protocol LoginViewDelegate {
    func targetForgetPasswordViewAction()
    func targetRegistrationViewAction()
}

class LoginView: BasicView {
    
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
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        return textField
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
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
    
    private let noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.lnk50()
        return label
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.loginForgotPassword()
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.lnk100()
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.lnk10()
        return view
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.loginOr()
        label.textAlignment = .center
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.lnk50()
        label.backgroundColor = R.color.white500()
        return label
    }()
    
    private let appleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.apple()
        return imageView
    }()
    
    private let googleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.google()
        return imageView
    }()
    
    private let facebookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.facebook()
        return imageView
    }()
    
    internal var loginViewDelegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        configureTextField()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        self.backgroundColor = R.color.white500()
        contentView.addSubview(logoImage)
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(90)
        }
        
        contentView.addSubview(logoLabel)
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
            $0.centerX.equalTo(emailTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(logInButton)
        logInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
            $0.centerX.equalTo(emailTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(noAccountLabel)
        noAccountLabel.snp.makeConstraints {
            $0.top.equalTo(logInButton.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.snp.makeConstraints {
            $0.top.equalTo((noAccountLabel).snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.top.equalTo((forgotPasswordLabel).snp.bottom).offset(35)
            $0.leading.equalTo(logInButton)
            $0.trailing.equalTo(logInButton)
            $0.height.equalTo(1)
        }
        
        lineView.addSubview(orLabel)
        orLabel.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.centerX.centerY.equalToSuperview()
        }
        
        contentView.addSubview(googleImage)
        googleImage.snp.makeConstraints {
            $0.top.equalTo((lineView).snp.bottom).offset(35)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(appleImage)
        appleImage.snp.makeConstraints {
            $0.top.equalTo(googleImage)
            $0.trailing.equalTo(googleImage.snp.leading).offset(-20)
        }
        
        contentView.addSubview(facebookImage)
        facebookImage.snp.makeConstraints {
            $0.top.equalTo(googleImage)
            $0.leading.equalTo(googleImage.snp.trailing).offset(20)
        }
        
        let gestureForgetPasswordView = UITapGestureRecognizer(target: self, action: #selector(targetForgetPasswordViewDidTapped))
        gestureForgetPasswordView.numberOfTapsRequired = 1
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(gestureForgetPasswordView)
        
        let gestureRegistrationView = UITapGestureRecognizer(target: self, action: #selector(targetRegistrationViewDidTapped))
        gestureRegistrationView.numberOfTapsRequired = 1
        noAccountLabel.isUserInteractionEnabled = true
        noAccountLabel.addGestureRecognizer(gestureRegistrationView)
    }
    
    private func configureTextField() {
        emailTextField.placeholder = NSLocalizedString(R.string.localizable.loginMail(), comment: "")
        emailTextField.font = R.font.robotoRegular(size: 16.0)
        emailTextField.returnKeyType = .done
        emailTextField.clearButtonMode = .whileEditing
        
        passwordTextField.placeholder = NSLocalizedString(R.string.localizable.loginPassword(), comment: "")
        passwordTextField.font = R.font.robotoRegular(size: 16.0)
        passwordTextField.returnKeyType = .done
        passwordTextField.clearButtonMode = .whileEditing
    }
    
    private func configureLabel() {
        let noAccountString = R.string.localizable.loginNoAccount()
        let registrationString = R.string.localizable.loginRegistration()
        
        let text = "\(noAccountString) \(registrationString)"
        
        let noAccountLabelMutableString = NSMutableAttributedString(string: text)
        let rangeText = NSString(string: text).range(of: registrationString)
        
        let blackTextAtributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.color.lnk100() as Any,
            .font: R.font.robotoRegular(size: 14.0) as Any
        ]
        
        noAccountLabelMutableString.addAttributes(blackTextAtributes, range: rangeText)
        
        noAccountLabel.attributedText = noAccountLabelMutableString
        
    }
    
    @objc
    private func targetForgetPasswordViewDidTapped() {
        loginViewDelegate?.targetForgetPasswordViewAction()
    }
    
    @objc
    private func targetRegistrationViewDidTapped() {
        loginViewDelegate?.targetRegistrationViewAction()
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
