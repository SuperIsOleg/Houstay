//
//  AccountCell.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 21.09.22.
//

import Foundation


import UIKit

class AccountCell: UICollectionViewCell {
    static var reuseIdentifier = UUID()
    
    private let settingsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.lnk100()
        label.text = ""
        return label
    }()
    
    private let languageLabel: UILabel = {
       let label = UILabel()
        label.font = R.font.robotoRegular(size: 16)
        label.textColor = R.color.lnk50()
        label.text = ""
        return label
    }()
    
    private let arrowsButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let switchSounds: UISwitch = {
        let switchSounds = UISwitch()
        switchSounds.preferredStyle = .sliding
        switchSounds.thumbTintColor = R.color.white500()
        switchSounds.onTintColor = R.color.blue100()
        switchSounds.isHidden = true
        return switchSounds
    }()
    
    internal var arrowButton: UIButton { arrowsButton }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {

        self.addSubview(settingsImageView)
        settingsImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-12)
        }

        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(settingsImageView.snp.trailing).offset(12)
            $0.centerY.equalTo(settingsImageView)
        }
        
        self.addSubview(arrowsButton)
        arrowsButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.width.equalTo(16)
            $0.centerY.equalTo(settingsImageView)
        }
        
        self.addSubview(switchSounds)
        switchSounds.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.centerY.equalTo(settingsImageView)
        }
        
        self.addSubview(languageLabel)
        languageLabel.snp.makeConstraints {
            $0.trailing.equalTo(switchSounds.snp.leading).offset(-12)
            $0.centerY.equalTo(settingsImageView)
        }

    }
    
    internal func configure( _ model: SettingsItemsModel) {
        self.settingsImageView.image = model.imageSettings
        self.titleLabel.text = model.title
        self.arrowsButton.setImage(model.imageArrows, for: .normal)
        self.switchSounds.isHidden = model.switchSounds
        self.languageLabel.text = model.language
    }
    
    internal func getLanguageLabelText(_ text: String) {
        self.languageLabel.text = text
    }
    
}
