//
//  AboutAppViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 22.09.22.
//

import UIKit

class AboutAppViewController: UIViewController {
    
    private let aboutAppView = AboutAppView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupLayout() {
        
        self.view.backgroundColor = R.color.yellow100()
        
        view.addSubview(aboutAppView)
        aboutAppView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
