//
//  BlogViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class BlogViewController: UIViewController {
    
    private let blogView = BlogView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        
        self.view.backgroundColor = R.color.yellow100()
        
        view.addSubview(blogView)
        blogView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
