//
//  LoginViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        self.hiseKeyboardOnTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillAppear(animated)
    }

    private func setupLayout() {
        loginView.loginViewDelegate = self
        
        view.addSubview(loginView)
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func targetRegistrationViewAction() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.navigationBar.tintColor = R.color.blue100()
        self.navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
    func targetForgetPasswordViewAction() {
        let forgetPasswordViewController = ForgetPasswordViewController()
        forgetPasswordViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.navigationBar.tintColor = R.color.blue100()
        self.navigationController?.pushViewController(forgetPasswordViewController, animated: true)
    }
}
