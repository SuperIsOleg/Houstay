//
//  AboutAppView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 22.09.22.
//

import UIKit

class AboutAppView: BasicView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.backgroundColor = R.color.yellow100()
    }
    
}
