//
//  ForgetPasswordViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    private let forgetPasswordView = ForgetPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func setupLayout() {
        view.addSubview(forgetPasswordView)
        forgetPasswordView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
   
}
