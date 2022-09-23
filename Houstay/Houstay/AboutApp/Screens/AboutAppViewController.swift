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
        self.setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBar()
    }
    
    private func setupLayout() {
        
        self.view.backgroundColor = R.color.yellow100()
        
        view.addSubview(aboutAppView)
        aboutAppView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.topItem?.title = R.string.localizable.aboutAppAboutApp()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: R.font.robotoMedium(size: 20) ?? UIFont(),
                                                                         NSAttributedString.Key.foregroundColor: R.color.white100() ?? UIColor()]
    }
    
}
