//
//  ProfileViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    private let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        self.setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func setupLayout() {
        self.profileView.nameViewConfigure.configure(R.string.localizable.profileName(),
                                                     self.viewModel.name)
        self.profileView.emailViewConfigure.configure(R.string.localizable.profileEmail(),
                                                      self.viewModel.email)
        self.profileView.phoneNumberViewConfigure.configure(R.string.localizable.profilePhoneNumber(),
                                                       self.viewModel.phoneNumbers)
        
        self.view.backgroundColor = R.color.white500()
        view.addSubview(profileView)
        profileView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
 
}
