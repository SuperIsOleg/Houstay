//
//  CreateNewPasswordViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {
    
    private let createNewPasswordView = CreateNewPasswordView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(createNewPasswordView)
        createNewPasswordView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
