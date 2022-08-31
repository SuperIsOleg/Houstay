//
//  RegistrationViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

class RegistrationViewController: UIViewController {

    private let registrationView = RegistrationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupLayout() {
        view.addSubview(registrationView)
        registrationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
 
}
