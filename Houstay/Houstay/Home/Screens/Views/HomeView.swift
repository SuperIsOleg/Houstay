//
//  HomeView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

protocol HomeViewDelegate {
    func exitAction()
}

class HomeView: BasicView {
    
    private let headerView = HeaderView()
    
    internal var homeViewDelegate: HomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        headerView.headerViewDelegate = self
        
        contentView.backgroundColor = R.color.blue100()
        
        self.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        contentView.snp.remakeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalToSuperview().priority(.low)
        }
    }
    
    internal func setNameUserLabel(userName: String) {
        headerView.setUserName(userName: userName)
    }
    
}

extension HomeView: HeaderViewDelegate {
    func exitAction() {
        homeViewDelegate?.exitAction()
    }
    
    
}