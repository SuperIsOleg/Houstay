//
//  RegistrationViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegistrationViewController: UIViewController {
    
    private let registrationView = RegistrationView()
    
    override func loadView() {
        super.loadView()
        self.view = registrationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        registrationView.registrationViewDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.shadowColor = .clear
        appearance.backgroundColor = R.color.white500()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationController?.navigationBar.tintColor = R.color.lnk100()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.chevronLeft(),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(self.popViewController))
    }
    
    @objc
    private func popViewController() {
        self.navigationController?.popViewController(animated: true)
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
