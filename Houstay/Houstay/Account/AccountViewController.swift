//
//  AccountViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class AccountViewController: UIViewController {
    
    private let account = Account()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        
        self.view.backgroundColor = R.color.red100()
        view.addSubview(account)
        account.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
