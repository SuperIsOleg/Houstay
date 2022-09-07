//
//  ForgetPasswordViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit
import Firebase

class ForgetPasswordViewController: UIViewController {
    
    private let forgetPasswordView = ForgetPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgetPasswordView.forgetPasswordViewDelegate = self
        
        self.hideKeyboardOnTap()
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

extension ForgetPasswordViewController: ForgetPasswordViewDelegate {
    func continueButtonAction() {
        let emailTextField = forgetPasswordView.setEmailTextField()
        guard let textEmailTextField = emailTextField.text else { return }
        
        if !textEmailTextField.isEmpty {
            Auth.auth().sendPasswordReset(withEmail: textEmailTextField) { error in
                if error == nil {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    self.forgetPasswordView.isWrongLoginOrPasswordLabelEnabled()
                    emailTextField.layer.borderColor = R.color.red100()?.cgColor
                }
            }
        }

    }
    
    func targetRegistrationViewAction() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.navigationBar.tintColor = R.color.blue100()
        self.navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
    
}
