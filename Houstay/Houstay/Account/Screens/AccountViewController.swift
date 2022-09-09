//
//  AccountViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let account = Account()
    private let accountViewModel = AccountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        
        self.view.backgroundColor = R.color.white500()
        account.setNameUserAndEmailLabel(userName: accountViewModel.name,
                                         email: accountViewModel.email)
        
        view.addSubview(account)
        account.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
