//
//  ProfileViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func setupLayout() {
        
        self.view.backgroundColor = R.color.white500()
        view.addSubview(profileView)
        profileView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
 
}
