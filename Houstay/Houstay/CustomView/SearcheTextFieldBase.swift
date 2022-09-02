//
//  SearcheTextFieldBase.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class SearcheTextFieldBase: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 12
        self.placeholder = NSLocalizedString(R.string.localizable.headerSearch(), comment: "")
        self.font = R.font.robotoRegular(size: 16.0)
        self.returnKeyType = .done
        self.clearButtonMode = .whileEditing
        self.backgroundColor = R.color.white500()

        let searchIcon = UIImageView(image: R.image.search())
        searchIcon.contentMode = .scaleAspectFit
        self.leftView = searchIcon
        self.leftViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowColor = R.color.lnk100()!.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 12
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.masksToBounds = false
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 30))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 30))
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let leftViewHeight: CGFloat = 20
        let y = bounds.size.height / 2 - leftViewHeight / 2
        return CGRect(x: 8.0, y: y, width: leftViewHeight, height: leftViewHeight)
    }

}
