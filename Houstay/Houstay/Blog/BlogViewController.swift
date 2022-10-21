//
//  BlogViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class BlogViewController: UIViewController {
    
    private let blogView = BlogView()
    
    override func loadView() {
        super.loadView()
        self.view = blogView
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
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = R.color.white500()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: R.color.lnk100() ?? .black,
            NSAttributedString.Key.font: R.font.robotoMedium(size: 20) ?? .systemFont(ofSize: 20)
        ]
        self.navigationItem.title = R.string.localizable.blogBlog()
    }
  
}
