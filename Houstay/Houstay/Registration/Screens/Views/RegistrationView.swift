//
//  RegistrationView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit
import Firebase

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
    
    private let savePasswordTextField: CustomTextField = {
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
        savePasswordTextField.delegate = self
        
        self.backgroundColor = R.color.white500()
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(enterAccountNameTextField)
        enterAccountNameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(mailTextField)
        mailTextField.snp.makeConstraints {
            $0.top.equalTo(enterAccountNameTextField.snp.bottom).offset(16)
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(enterNewPasswordTextField)
        enterNewPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(mailTextField.snp.bottom).offset(16)
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(savePasswordTextField)
        savePasswordTextField.snp.makeConstraints {
            $0.top.equalTo(enterNewPasswordTextField.snp.bottom).offset(16)
            $0.leading.equalTo(enterAccountNameTextField)
            $0.trailing.equalTo(enterAccountNameTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(termOfUseLabel)
        termOfUseLabel.snp.makeConstraints {
            $0.top.equalTo(savePasswordTextField.snp.bottom).offset(16)
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
    
}

extension RegistrationView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let name = enterAccountNameTextField.text!
        let email = mailTextField.text!
        let password = enterNewPasswordTextField.text!
        
        if (!name.isEmpty && !email.isEmpty && !password.isEmpty) {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                    if let result = result {
                        print(result.user.uid)
                        let reference = Database.database().reference().child("users")
                        reference.child(result.user.uid).updateChildValues(["name": name, "email": email])
                    }
                }
            }
        } else {
            print("заполните поля")
        }
        
        textField.resignFirstResponder()
        return true
    }
    
}
