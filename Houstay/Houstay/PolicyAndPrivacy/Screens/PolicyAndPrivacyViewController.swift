//
//  PolicyAndPrivacyViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class PolicyAndPrivacyViewController: UIViewController {
    
    private let policyAndPrivacyView = PolicyAndPrivacyView()
    
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
        view.addSubview(policyAndPrivacyView)
        policyAndPrivacyView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
 
}
