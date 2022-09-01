//
//  HeaderView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 1.09.22.
//

import UIKit

protocol HeaderViewDelegate {
    func exitAction()
}

class HeaderView: UIView {
    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = R.color.blue100()
        button.setTitle("Exit", for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.titleLabel?.textColor = R.color.white500()
        return button
    }()
    
    internal var headerViewDelegate: HeaderViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        self.addSubview(exitButton)
        exitButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(30)
            $0.width.equalTo(70)
        }
        
        exitButton.addTarget(self, action: #selector(exitTap), for: .touchUpInside)
    }
    
    @objc func exitTap() {
        headerViewDelegate?.exitAction()
    }

}
