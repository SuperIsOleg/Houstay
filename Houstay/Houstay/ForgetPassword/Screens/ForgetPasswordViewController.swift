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
    
    override func loadView() {
        super.loadView()
        self.view = forgetPasswordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgetPasswordView.forgetPasswordViewDelegate = self
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
