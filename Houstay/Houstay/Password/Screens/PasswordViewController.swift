//
//  PasswordViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 24.09.22.
//

import UIKit

class PasswordViewController: UIViewController {
    
    private let passwordView = PasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        self.setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func setupLayout() {
        self.view.backgroundColor = R.color.white500()
        view.addSubview(passwordView)
        passwordView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
 
}
