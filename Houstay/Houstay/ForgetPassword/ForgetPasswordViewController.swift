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
        let chekPasswordViewController = ChekPasswordViewController()
        guard let text = forgetPasswordView.setEmailTextField().text else { return }
        chekPasswordViewController.setChekPasswordView().configurePasswordAccountLabel(emalString: text)
        chekPasswordViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.navigationBar.tintColor = R.color.blue100()
        self.navigationController?.pushViewController(chekPasswordViewController, animated: true)
    }
    
    func targetRegistrationViewAction() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.navigationBar.tintColor = R.color.blue100()
        self.navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
    
}
