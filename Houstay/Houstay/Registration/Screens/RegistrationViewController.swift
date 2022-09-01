//
//  RegistrationViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit
import Firebase

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
        registrationView.registrationViewDelegate = self
        
        view.addSubview(registrationView)
        registrationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension RegistrationViewController: RegistrationViewDelegate {
    func registerAction() {
        
        let name = registrationView.setEnterAccountNameTextField()
        let email = registrationView.setMailTextField()
        let enterPassword = registrationView.setEnterNewPasswordTextField()
        let repeatPassword = registrationView.setRepeatPasswordTextField()
        
        guard let nameText = name.text,
              let emailText = email.text,
              let enterPasswordText = enterPassword.text,
              let repeatPasswordText = repeatPassword.text else { return }
        
        if !nameText.isEmpty && !emailText.isEmpty && !enterPasswordText.isEmpty && !repeatPasswordText.isEmpty {
            if enterPasswordText == repeatPasswordText {
                Auth.auth().createUser(withEmail: emailText, password: enterPasswordText) { result, error in
                    if error == nil {
                        if let result = result {
                            let reference = Database.database().reference().child("users")
                            reference.child(result.user.uid).updateChildValues(["name": nameText, "email": emailText])
                            
                            let homeViewController = HomeViewController()
                            self.navigationController?.setViewControllers([homeViewController], animated: false)
                        }
                    } else {
                        self.registrationView.isEmailIncorrectlyLabelEnabled()
                        email.layer.borderColor = R.color.red100()?.cgColor
                    }
                }
            } else {
                self.registrationView.isPasswordNotMatchLabelEnabled()
                repeatPassword.layer.borderColor = R.color.red100()?.cgColor
            }
        } else {
            print("заполните поля")
        }
        
    }
    
}
