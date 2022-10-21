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

protocol LoginViewControllerDelegate: AnyObject {
    func appFlow()
}

class LoginViewController: UIViewController {
    private let loginView = LoginView()
    internal weak var appFlowDelegate: LoginViewControllerDelegate?
    
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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func targetGoogleImageAction() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if error == nil {
            } else {
                print("Не получен config")
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if  error == nil {
                    self.appFlowDelegate?.appFlow()
//                    let tabBar = TabBarController()
//                    self.navigationController?.setViewControllers([tabBar], animated: true)
                } else {
                    print("Вход не выполнен")
                }
            }
        }
    }
    
    func logInAction() {
        let email = loginView.getEmailTextField()
        let enterPassword = loginView.getPasswordTextField()
        
        guard let emailText = email.text,
              let enterPasswordText = enterPassword.text else { return }
        
        if !emailText.isEmpty && !enterPasswordText.isEmpty {
            Auth.auth().signIn(withEmail: emailText, password: enterPasswordText) { result, error in
                if error == nil {
                    let tabBar = TabBarController()
                    self.navigationController?.setViewControllers([tabBar], animated: true)
                } else {
                    self.loginView.isWrongLoginOrPasswordLabelEnabled()
                    email.layer.borderColor = R.color.red100()?.cgColor
                    enterPassword.layer.borderColor = R.color.red100()?.cgColor
                }
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
