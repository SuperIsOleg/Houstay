//
//  CreateNewPasswordView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

class CreateNewPasswordView: BasicView {
    
    private let verifyAccountLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.createNewPasswordCreateNewPassword()
        label.font = R.font.robotoMedium(size: 24)
        label.textColor = R.color.lnk100()
        label.numberOfLines = 0
        return label
    }()
    
    private let enterNewPasswordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.blue100()?.cgColor
        textField.placeholder = NSLocalizedString(R.string.localizable.createNewPasswordEnterNewPassword(), comment: "")
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
        textField.placeholder = NSLocalizedString(R.string.localizable.createNewPasswordRepeatPassword(), comment: "")
        textField.isSecureTextEntry = true
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = R.color.blue100()
        button.setTitle(R.string.localizable.createNewPasswordSavePassword(), for: .normal)
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
        enterNewPasswordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        
        self.backgroundColor = R.color.white500()
        contentView.addSubview(verifyAccountLabel)
        verifyAccountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(enterNewPasswordTextField)
        enterNewPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(verifyAccountLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(repeatPasswordTextField)
        repeatPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(enterNewPasswordTextField.snp.bottom).offset(16)
            $0.leading.equalTo(enterNewPasswordTextField)
            $0.trailing.equalTo(enterNewPasswordTextField)
            $0.centerX.equalTo(enterNewPasswordTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.top.equalTo(repeatPasswordTextField.snp.bottom).offset(30)
            $0.leading.equalTo(enterNewPasswordTextField)
            $0.trailing.equalTo(enterNewPasswordTextField)
            $0.centerX.equalTo(enterNewPasswordTextField)
            $0.height.equalTo(50)
        }
    }
}

extension CreateNewPasswordView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
