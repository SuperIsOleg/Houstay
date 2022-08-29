//
//  OnboardingView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.08.22.
//

import UIKit
import SnapKit

class OnboardingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = R.color.blue100()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
