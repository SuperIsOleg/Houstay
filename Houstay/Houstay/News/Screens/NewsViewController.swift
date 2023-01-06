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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
