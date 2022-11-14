//
//  PolicyAndPrivacyViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class PolicyAndPrivacyViewController: UIViewController {
    
    private let policyAndPrivacyView = PolicyAndPrivacyView()
    
    override func loadView() {
        super.loadView()
        self.view = policyAndPrivacyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
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
        self.navigationItem.title = R.string.localizable.aboutAppPolicyAndPrivacy()
    }
 
    @objc
    private func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
