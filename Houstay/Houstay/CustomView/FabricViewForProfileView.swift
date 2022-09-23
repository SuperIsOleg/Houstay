//
//  FabricViewForProfileView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class FabricViewForProfileView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.robotoRegular(size: 12)
        label.textColor = R.color.lnk50()
        return label
    }()
    
    private let textField: CustomTextField = {
        let textField = CustomTextField()
        textField.textColor = R.color.lnk100()
        textField.font = R.font.robotoRegular(size: 16.0)
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.textField.delegate = self
        
        self.backgroundColor = R.color.white500()
        self.layer.borderWidth = 1
        self.layer.borderColor = R.color.lnk10()?.cgColor
        self.layer.cornerRadius = 8.0
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(15)
        }
        
        self.addSubview(textField)
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    internal func configure(_ titleText: String,  _ textFieldText: String ) {
        self.titleLabel.text = titleText
        self.textField.text = textFieldText
    }
    
}

extension FabricViewForProfileView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
