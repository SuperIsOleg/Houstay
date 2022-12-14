//
//  ProfileViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    private let viewModel = ProfileViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        self.setupLayout()
        profileView.profileViewDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupLayout() {
        self.profileView.nameViewConfigure.configure(R.string.localizable.profileName(),
                                                     self.viewModel.name)
        self.profileView.emailViewConfigure.configure(R.string.localizable.profileEmail(),
                                                      self.viewModel.email)
        self.profileView.phoneNumberViewConfigure.configure(R.string.localizable.profilePhoneNumber(),
                                                       self.viewModel.phoneNumbers)
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
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
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: R.color.lnk100() ?? .black,
            NSAttributedString.Key.font: R.font.robotoMedium(size: 20) ?? .systemFont(ofSize: 20)
        ]
        self.navigationItem.title = R.string.localizable.profileProfile()
    }
    
    @objc
    private func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - ProfileViewDelegate
extension ProfileViewController: ProfileViewDelegate {
    func deleteAccountLabelAction() {
        self.viewModel.deleteAccount {
            self.infoAlert(text: R.string.localizable.alertDeleteAccount()) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
