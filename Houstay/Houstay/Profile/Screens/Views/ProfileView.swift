//
//  ProfileView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func deleteAccountLabelAction()
}

class ProfileView: BasicView {
    
    private let nameView: FabricViewForProfileView = {
        let view = FabricViewForProfileView()
        return view
    }()
    
    private let emailView: FabricViewForProfileView = {
        let view = FabricViewForProfileView()
        view.textFieldCongirure.keyboardType = .emailAddress
        return view
    }()
    
    private let phoneNumberView: FabricViewForProfileView = {
        let view = FabricViewForProfileView()
        view.textFieldCongirure.keyboardType = .phonePad
        return view
    }()
    
    private let deleteAccountLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 14)
        label.textColor = R.color.red100()
        label.text = R.string.localizable.profileDeleteAccount()
        label.isUserInteractionEnabled = true
        return label
    }()
    
    internal var nameViewConfigure: FabricViewForProfileView { nameView }
    internal var emailViewConfigure: FabricViewForProfileView { emailView }
    internal var phoneNumberViewConfigure: FabricViewForProfileView { phoneNumberView }
    internal weak var profileViewDelegate: ProfileViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        configureGecture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()

        contentView.addSubview(nameView)
        nameView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(emailView)
        emailView.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(phoneNumberView)
        phoneNumberView.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(deleteAccountLabel)
        deleteAccountLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configureGecture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(deleteAccountTap(sender:)))
        deleteAccountLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func deleteAccountTap(sender: UITapGestureRecognizer) {
        profileViewDelegate?.deleteAccountLabelAction()
    }
}

