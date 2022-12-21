//
//  AccountCell.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 21.09.22.
//

import Foundation


import UIKit

class AccountCell: UITableViewCell {
    static var reuseIdentifier = String(describing: AccountCell.self)
    
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
        return label
    }()
    
    private let arrowButton: ConfigurableTapAreaButton = {
        let button = ConfigurableTapAreaButton()
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
    
    internal var getArrowButton: ConfigurableTapAreaButton { arrowButton }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func setupLayout() {

        self.contentView.addSubview(settingsImageView)
        settingsImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-12)
        }

        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(settingsImageView.snp.trailing).offset(12)
            $0.centerY.equalTo(settingsImageView)
        }
        
        self.contentView.addSubview(arrowButton)
        arrowButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.width.equalTo(16)
            $0.centerY.equalTo(settingsImageView)
        }
        arrowButton.layer.zPosition = 3
        
        self.contentView.addSubview(switchSounds)
        switchSounds.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.centerY.equalTo(settingsImageView)
        }
        
        self.contentView.addSubview(languageLabel)
        languageLabel.snp.makeConstraints {
            $0.trailing.equalTo(arrowButton.snp.leading).offset(-12)
            $0.centerY.equalTo(settingsImageView)
        }

    }
    
    
    
    internal func configureTapAreaButton() {
        guard let text = languageLabel.text else { return }
        let languageLabelLight = text.size(withAttributes:
                                            [NSAttributedString.Key.font:
                                                languageLabel.font ?? UIFont()]).width + 12 // 12 - this languageLabel constraint
        self.arrowButton.changeTapAreaBy(insets: UIEdgeInsets(top: -20,
                                                              left: -languageLabelLight,
                                                              bottom: 20,
                                                              right: 20))
    }
    
    internal func configure( _ model: SettingsItemsModel) {
        self.settingsImageView.image = model.imageSettings
        self.titleLabel.text = model.title
        self.arrowButton.setImage(model.imageArrows, for: .normal)
        self.switchSounds.isHidden = model.switchSounds
        self.languageLabel.text = model.language
    }
    
    internal func getLanguageLabelText(_ text: String) {
        self.languageLabel.text = text
        self.configureTapAreaButton()
    }
    
}
