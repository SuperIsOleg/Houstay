//
//  AccountViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {
    
    private let accountView = AccountView()
    private let accountViewModel = AccountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        accountView.accountViewDelegate = self
        
        self.view.backgroundColor = R.color.white500()
        accountView.setNameUserAndEmailLabel(userName: accountViewModel.name,
                                         email: accountViewModel.email)
        
        view.addSubview(accountView)
        accountView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - AccountViewDelegate

extension AccountViewController: AccountViewDelegate {
    func exitAction() {
        do {
            try  Auth.auth().signOut()
        } catch {
            print("Error")
        }
    }
    
    
}
