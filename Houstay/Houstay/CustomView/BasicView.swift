//
//  BasicView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

class BasicView: UIView {
    
    internal var contentScrollView = UIScrollView()
    internal var contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(contentScrollView)
        contentScrollView.backgroundColor = R.color.white500()
        contentScrollView.snp.makeConstraints({
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(self.keyboardLayoutGuide.snp.top)
        })
        
        
        contentScrollView.addSubview(contentView)
        contentView.backgroundColor = R.color.white500()
        contentView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalToSuperview().priority(.low)
            
        })
    }
    
}
