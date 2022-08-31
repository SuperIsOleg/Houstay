//
//  HomeViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillAppear(animated)
    }

    private func setupLayout() {
        
        self.view.backgroundColor = R.color.blue100()
        
        self.view.addSubview(homeView)
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
