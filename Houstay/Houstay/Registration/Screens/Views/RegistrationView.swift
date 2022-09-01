//
//  RegistrationView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

protocol RegistrationViewDelegate {
    func registerAction()
}

class RegistrationView: BasicView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.registrationTitle()
        label.font = R.font.robotoMedium(size: 24)
        label.textColor = R.color.lnk100()
        label.textAlignment = .center
        label.numberOfLines = 0
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
    
    private let enterAccountNameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        textField.placeholder = NSLocalizedString(R.string.localizable.registrationEnterAccountName(), comment: "")
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let mailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        textField.placeholder = NSLocalizedString(R.string.localizable.registrationMail(), comment: "")
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    private let emailIncorrectlyLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.registrationEmailIncorrectly()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.red100()
        label.isHidden = true
        return label
    }()
    
    private let enterNewPasswordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        textField.placeholder = NSLocalizedString(R.string.localizable.registrationEnterNewPassword(), comment: "")
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let repeatPasswordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        textField.placeholder = NSLocalizedString(R.string.localizable.registrationSavePassword(), comment: "")
        textField.isSecureTextEntry = true
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordNotMatchLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.registrationPasswordNotMatch()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.red100()
        label.isHidden = true
        return label
    }()
    
    private let termOfUseLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.lnk50()
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = R.color.blue100()
        button.setTitle(R.string.localizable.registrationRegister(), for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.titleLabel?.textColor = R.color.white500()
        return button
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
    
    internal var registrationViewDelegate: RegistrationViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        enterAccountNameTextField.delegate = self
        mailTextField.delegate = self
        enterNewPasswordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        
        self.backgroundColor = R.color.white500()
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        stackView.addArrangedSubview(enterAccountNameTextField)
        enterAccountNameTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(mailTextField)
        mailTextField.snp.makeConstraints {
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
            $0.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(emailIncorrectlyLabel)
        emailIncorrectlyLabel.snp.makeConstraints {
            $0.top.equalTo(mailTextField.snp.bottom).offset(16)
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
        }
        
        stackView.addArrangedSubview(enterNewPasswordTextField)
        enterNewPasswordTextField.snp.makeConstraints {
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
            $0.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(repeatPasswordTextField)
        repeatPasswordTextField.snp.makeConstraints {
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
            $0.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(passwordNotMatchLabel)
        passwordNotMatchLabel.snp.makeConstraints {
            $0.top.equalTo(repeatPasswordTextField.snp.bottom).offset(16)
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
        }
        
        contentView.addSubview(termOfUseLabel)
        termOfUseLabel.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(16)
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(registerButton)
        registerButton.snp.makeConstraints {
            $0.top.equalTo(termOfUseLabel.snp.bottom).offset(30)
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.top.equalTo((registerButton).snp.bottom).offset(35)
            $0.leading.equalTo(registerButton)
            $0.trailing.equalTo(registerButton)
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
        
        registerButton.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
    }
    
    private func configureLabel() {
        let tapRegisterString = R.string.localizable.registrationTapRegister()
        let termOfUseString = R.string.localizable.registrationTermOfUse()
        
        let text = "\(tapRegisterString) \(termOfUseString)"
        
        let termOfUseLabelMutableString = NSMutableAttributedString(string: text)
        let rangeText = NSString(string: text).range(of: termOfUseString)
        
        let blackTextAtributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.color.blue100() as Any,
            .font: R.font.robotoRegular(size: 14.0) as Any
        ]
        
        termOfUseLabelMutableString.addAttributes(blackTextAtributes, range: rangeText)
        termOfUseLabel.attributedText = termOfUseLabelMutableString
    }
    
    @objc
    private func registerButtonTap() {
        registrationViewDelegate?.registerAction()
    }
    
    internal func setEnterAccountNameTextField() -> CustomTextField {
        return enterAccountNameTextField
    }
    
    internal func setMailTextField() -> CustomTextField {
        return mailTextField
    }
    
    internal func setEnterNewPasswordTextField() -> CustomTextField {
        return enterNewPasswordTextField
    }
    
    internal func setRepeatPasswordTextField() -> CustomTextField {
        return repeatPasswordTextField
    }
    
    internal func isPasswordNotMatchLabelEnabled() {
        self.passwordNotMatchLabel.isHidden = false
    }
    
    internal func isEmailIncorrectlyLabelEnabled() {
        self.emailIncorrectlyLabel.isHidden = false
    }
    
}

extension RegistrationView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {        
            if !textField.placeholder!.isEmpty {
                textField.text = nil
                self.passwordNotMatchLabel.isHidden = true
                self.emailIncorrectlyLabel.isHidden = true
                textField.layer.borderColor = R.color.blue100()?.cgColor
            }
    }
  
}
