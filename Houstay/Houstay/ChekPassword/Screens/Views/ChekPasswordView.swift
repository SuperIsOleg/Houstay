//
//  ChekPasswordView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

protocol ChekPasswordViewDelegate {
    func targetDontGetPasswordAccountAction()
    func continueButtonAction()
}

class ChekPasswordView: BasicView {
    
    private let verifyAccountLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.chekPasswordVerifyAccount()
        label.font = R.font.robotoMedium(size: 24)
        label.textColor = R.color.lnk100()
        label.numberOfLines = 0
        return label
    }()
    
    private let passwordAccountLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoMedium(size: 14)
        label.textColor = R.color.lnk50()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 15.0
        return stackView
    }()
    
    private lazy var firsteTextField = createTextField()
    private lazy var secondTextField = createTextField()
    private lazy var thirdTextField = createTextField()
    private lazy var fourthTextField = createTextField()
    
    private let dontGetPasswordAccountLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.lnk50()
        return label
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = R.color.blue100()
        button.setTitle(R.string.localizable.chekPasswordContinue(), for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.titleLabel?.textColor = R.color.white500()
        return button
    }()
    
    internal var chekPasswordViewDelegate: ChekPasswordViewDelegate?
    
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
        
        firsteTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
        
        contentView.addSubview(verifyAccountLabel)
        verifyAccountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(passwordAccountLabel)
        passwordAccountLabel.snp.makeConstraints {
            $0.top.equalTo(verifyAccountLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(passwordAccountLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(firsteTextField)
        firsteTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(45)
        }
        
        stackView.addArrangedSubview(secondTextField)
        secondTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(45)
        }
        
        stackView.addArrangedSubview(thirdTextField)
        thirdTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(45)
        }
        
        stackView.addArrangedSubview(fourthTextField)
        fourthTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(45)
        }
        
        contentView.addSubview(dontGetPasswordAccountLabel)
        dontGetPasswordAccountLabel.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(continueButton)
        continueButton.snp.makeConstraints {
            $0.top.equalTo(dontGetPasswordAccountLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        
        continueButton.addTarget(self, action: #selector(continueButtonTap), for: .touchUpInside)
        
        let gestureRegistrationView = UITapGestureRecognizer(target: self, action: #selector(targetDontGetPasswordAccountTap))
        gestureRegistrationView.numberOfTapsRequired = 1
        dontGetPasswordAccountLabel.isUserInteractionEnabled = true
        dontGetPasswordAccountLabel.addGestureRecognizer(gestureRegistrationView)
  
    }
    
    private func configureLabel() {
        let dontGetPasswordAccountString = R.string.localizable.chekPasswordDontGetPasswordAccount()
        let sendPasswordAccountString = R.string.localizable.chekPasswordSendPasswordAccount()
        
        let text = "\(dontGetPasswordAccountString) \(sendPasswordAccountString)"
        
        let dontGetPasswordAccountLabelMutableString = NSMutableAttributedString(string: text)
        let rangeText = NSString(string: text).range(of: sendPasswordAccountString)
        
        let blackTextAtributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.color.lnk100() as Any,
            .font: R.font.robotoRegular(size: 14.0) as Any
        ]
        
        dontGetPasswordAccountLabelMutableString.addAttributes(blackTextAtributes, range: rangeText)
        dontGetPasswordAccountLabel.attributedText = dontGetPasswordAccountLabelMutableString
    }
    
    private func createTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = R.color.lnk50()?.cgColor
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.keyboardType = .numberPad
        textField.returnKeyType = .done
        textField.textAlignment = .center
        return textField
    }
    
    internal func configurePasswordAccountLabel(emalString: String) {
        let passwordAccountString = R.string.localizable.chekPasswordPasswordAccount()
        let emalStringString = emalString
        
        let text = "\(passwordAccountString) \(emalStringString)"
        
        let passwordAccountLabelMutableString = NSMutableAttributedString(string: text)
        let rangeText = NSString(string: text).range(of: emalStringString)
        
        let blackTextAtributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.color.lnk100() as Any,
            .font: R.font.robotoRegular(size: 14.0) as Any
        ]
        
        passwordAccountLabelMutableString.addAttributes(blackTextAtributes, range: rangeText)
        passwordAccountLabel.attributedText = passwordAccountLabelMutableString
    }

    @objc
    private func targetDontGetPasswordAccountTap() {
       
    }
    
    @objc
    private func continueButtonTap() {
        chekPasswordViewDelegate?.continueButtonAction()
    }
 
}

extension ChekPasswordView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
