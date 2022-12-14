//
//  LoginView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

protocol LoginViewDelegate {
    func logInAction()
    func targetForgetPasswordViewAction()
    func targetRegistrationViewAction()
    func targetGoogleImageAction()
    func targetFacebookImageAction()
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
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 16.0
        return stackView
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        textField.placeholder = NSLocalizedString(R.string.localizable.loginMail(), comment: "")
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        textField.placeholder = NSLocalizedString(R.string.localizable.loginPassword(), comment: "")
        textField.isSecureTextEntry = true
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let wrongLoginOrPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.loginWrongLoginOrPassword()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.red100()
        label.isHidden = true
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
            $0.top.equalToSuperview().offset(110)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(90)
        }
        
        contentView.addSubview(logoLabel)
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        stackView.addArrangedSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(wrongLoginOrPasswordLabel)
        wrongLoginOrPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
        }
        
        contentView.addSubview(logInButton)
        logInButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(30)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
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
            $0.bottom.lessThanOrEqualToSuperview()
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
        
        logInButton.addTarget(self, action: #selector(logInTap), for: .touchUpInside)
        
        let gestureForgetPasswordView = UITapGestureRecognizer(target: self, action: #selector(targetForgetPasswordViewDidTapped))
        gestureForgetPasswordView.numberOfTapsRequired = 1
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(gestureForgetPasswordView)
        
        let gestureRegistrationView = UITapGestureRecognizer(target: self, action: #selector(targetRegistrationViewDidTapped))
        gestureRegistrationView.numberOfTapsRequired = 1
        noAccountLabel.isUserInteractionEnabled = true
        noAccountLabel.addGestureRecognizer(gestureRegistrationView)
        
        let gestureRegistrationGoogleImage = UITapGestureRecognizer(target: self, action: #selector(targetGoogleImageDidTapped))
        gestureRegistrationGoogleImage.numberOfTapsRequired = 1
        googleImage.isUserInteractionEnabled = true
        googleImage.addGestureRecognizer(gestureRegistrationGoogleImage)
        
        let gestureRegistrationFacebookImage = UITapGestureRecognizer(target: self, action: #selector(targetFacebookImageDidTapped))
        gestureRegistrationFacebookImage.numberOfTapsRequired = 1
        facebookImage.isUserInteractionEnabled = true
        facebookImage.addGestureRecognizer(gestureRegistrationFacebookImage)
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
    
    internal func getEmailTextField() -> CustomTextField {
        return emailTextField
    }
    
    internal func getPasswordTextField() -> CustomTextField {
        return passwordTextField
    }
    
    internal func isWrongLoginOrPasswordLabelEnabled() {
        self.wrongLoginOrPasswordLabel.isHidden = false
    }
    
    @objc
    private func logInTap() {
        loginViewDelegate?.logInAction()
    }
    
    @objc
    private func targetForgetPasswordViewDidTapped() {
        loginViewDelegate?.targetForgetPasswordViewAction()
    }
    
    @objc
    private func targetRegistrationViewDidTapped() {
        loginViewDelegate?.targetRegistrationViewAction()
    }
    
    @objc
    private func targetGoogleImageDidTapped() {
        loginViewDelegate?.targetGoogleImageAction()
    }
    
    @objc
    private func targetFacebookImageDidTapped() {
        loginViewDelegate?.targetFacebookImageAction()
    }
    
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            if !textField.placeholder!.isEmpty {
                self.wrongLoginOrPasswordLabel.isHidden = true
                emailTextField.layer.borderColor = R.color.blue100()?.cgColor
                passwordTextField.layer.borderColor = R.color.blue100()?.cgColor
            }
    }
}
