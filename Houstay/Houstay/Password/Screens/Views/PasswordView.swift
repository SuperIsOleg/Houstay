//
//  PasswordView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 24.09.22.
//

import UIKit

class PasswordView: BasicView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()

    }
}
