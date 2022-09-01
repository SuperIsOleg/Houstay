//
//  ForgetPasswordView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

protocol ForgetPasswordViewDelegate {
    func targetRegistrationViewAction()
    func continueButtonAction()
    
}

class ForgetPasswordView: BasicView {
    
    private let forgetPasswordogoLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.forgotPasswordTitle()
        label.font = R.font.robotoMedium(size: 24)
        label.textColor = R.color.lnk100()
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
        textField.placeholder = NSLocalizedString(R.string.localizable.forgotPasswordMail(), comment: "")
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let emailIsInvalidLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.forgotPasswordEmailIsInvalid()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.red100()
        label.isHidden = true
        return label
    }()
    
    private let continueButton: UIButton = {
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
    
    internal var forgetPasswordViewDelegate: ForgetPasswordViewDelegate?
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupLayout()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        emailTextField.delegate = self
        
        contentView.addSubview(forgetPasswordogoLabel)
        forgetPasswordogoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(forgetPasswordogoLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        stackView.addArrangedSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(emailIsInvalidLabel)
        emailIsInvalidLabel.snp.makeConstraints {
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
        }
        
        contentView.addSubview(continueButton)
        continueButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(30)
            $0.leading.equalTo(emailTextField)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(50)
        }
        
        contentView.addSubview(noAccountLabel)
        noAccountLabel.snp.makeConstraints {
            $0.top.equalTo(continueButton.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        continueButton.addTarget(self, action: #selector(continueButtonTap), for: .touchUpInside)
        
        let gestureRegistrationView = UITapGestureRecognizer(target: self, action: #selector(targetRegistrationViewDidTapped))
        gestureRegistrationView.numberOfTapsRequired = 1
        noAccountLabel.isUserInteractionEnabled = true
        noAccountLabel.addGestureRecognizer(gestureRegistrationView)
  
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
    
    internal func setEmailTextField() -> CustomTextField {
        return emailTextField
    }
    
    internal func isWrongLoginOrPasswordLabelEnabled() {
        self.emailIsInvalidLabel.isHidden = false
    }

    @objc
    private func targetRegistrationViewDidTapped() {
        forgetPasswordViewDelegate?.targetRegistrationViewAction()
    }
    
    @objc
    private func continueButtonTap() {
        forgetPasswordViewDelegate?.continueButtonAction()
    }
 
}

extension ForgetPasswordView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            if !textField.placeholder!.isEmpty {
                self.emailIsInvalidLabel.isHidden = true
                emailTextField.layer.borderColor = R.color.blue100()?.cgColor
            }
    }
    
}
