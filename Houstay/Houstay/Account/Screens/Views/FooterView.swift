//
//  FooterView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 21.12.22.
//

import UIKit

protocol FooterViewDelegate {
    func exitAction()
}

class FooterView: UIView {
    
    private let container: UIView = {
        let view = UIView()
        return view
    }()
    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = R.color.blue5()
        button.setTitle(R.string.localizable.accountExit(), for: .normal)
        button.titleLabel?.font = R.font.robotoMedium(size: 16)
        button.setTitleColor(R.color.blue100(), for: .normal)
        return button
    }()
    
    internal var footerViewDelegate: FooterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        self.addSubview(container)
        container.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        container.addSubview(exitButton)
        exitButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50)
        }
        exitButton.addTarget(self, action: #selector(exitTap), for: .touchUpInside)
    }
    
    @objc func exitTap() {
        footerViewDelegate?.exitAction()
    }
    
}
