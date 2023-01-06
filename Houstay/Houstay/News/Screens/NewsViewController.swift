//
//  MessagesViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit
import Firebase

class NewsViewController: UIViewController {
    
    private let newsView = NewsView()
    
    override func loadView() {
        super.loadView()
        self.view = newsView
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
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = R.color.white500()
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [
            .foregroundColor: R.color.white100() ?? .black,
            .font: R.font.robotoMedium(size: 18) ?? .systemFont(ofSize: 18),
        ]
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.tabBarController?.navigationItem.title = R.string.localizable.newsNews().uppercased()
    }
    
}
