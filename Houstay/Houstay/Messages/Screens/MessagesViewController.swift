//
//  MessagesViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit

class MessagesViewController: UIViewController {
    
    private let messagesView = MessagesView()
    
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
        view.addSubview(messagesView)
        messagesView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
 
}
