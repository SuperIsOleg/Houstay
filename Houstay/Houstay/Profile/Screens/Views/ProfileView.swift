//
//  ProfileView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

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
    
    internal var nameViewConfigure: FabricViewForProfileView { nameView }
    internal var emailViewConfigure: FabricViewForProfileView { emailView }
    internal var phoneNumberViewConfigure: FabricViewForProfileView { phoneNumberView }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
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
    }
}

