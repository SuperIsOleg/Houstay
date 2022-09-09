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

class HomeView: UIView {
    
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

        self.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

    }
    
    internal func setNameUserLabel(userName: String) {
        headerView.setUserName(userName: userName)
    }
    
    internal func getHeader() -> HeaderView {
        return headerView
    }

}

extension HomeView: HeaderViewDelegate {
    func exitAction() {
        homeViewDelegate?.exitAction()
    }
    
    
}
