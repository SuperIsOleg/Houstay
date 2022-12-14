//
//  LoginViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {
    private let loginView = LoginView()
    private let viewModel = LoginViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.loginViewDelegate = self
        self.hideKeyboardOnTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = R.color.white500()
        appearance.shadowColor = .clear
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationController?.navigationBar.tintColor = R.color.lnk100()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.chevronLeft(),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(self.popViewController))
    }
    
    private func signIntoFirebase() {
        guard let accesToken = AccessToken.current?.tokenString else { return }
        let credential = FacebookAuthProvider.credential(withAccessToken: accesToken)
        
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            guard let self = self else { return }
            if error == nil {
                self.navigationController?.popViewController(animated: true)
            } else {
                print("Вход не выполнен")
            }
        }
    }
    
    @objc
    private func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func targetFacebookImageAction() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: self) { [weak self] (result, error) in
            guard let self = self else { return }
            if error == nil {
                self.signIntoFirebase()
            }
        }
    }
    
    func targetGoogleImageAction() {
        self.viewModel.googleSignIn(viewController: self) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func logInAction() {
        let email = loginView.getEmailTextField()
        let enterPassword = loginView.getPasswordTextField()
        
        guard let emailText = email.text,
              let enterPasswordText = enterPassword.text else { return }

        if !emailText.isEmpty && !enterPasswordText.isEmpty {
            viewModel.logIn(email: emailText,
                            enterPassword: enterPasswordText) {
                self.navigationController?.popViewController(animated: true)
            } errorCompletion: {
                self.loginView.isWrongLoginOrPasswordLabelEnabled()
                email.layer.borderColor = R.color.red100()?.cgColor
                enterPassword.layer.borderColor = R.color.red100()?.cgColor
            }
            
        } else {
            print("заполните поля")
        }
    }

func targetRegistrationViewAction() {
    let registrationViewController = RegistrationViewController()
    self.navigationController?.pushViewController(registrationViewController, animated: true)
}

func targetForgetPasswordViewAction() {
    let forgetPasswordViewController = ForgetPasswordViewController()
    self.navigationController?.pushViewController(forgetPasswordViewController, animated: true)
}
}
