//
//  NewsView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class NewsView: UIView {
    
    private let headerView = HeaderView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = R.color.white500()
        
        self.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        headerView.configureTitle(title: .news)

    }
   
}
