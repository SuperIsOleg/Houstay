//
//  MessagesViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import UIKit
import Firebase

class MessagesViewController: UIViewController {
    
    private let messagesView = MessagesView()
    private let userAuthenticationView = UserAuthenticationView()
    private var handle: AuthStateDidChangeListenerHandle?
    
    override func loadView() {
        super.loadView()
        self.view = messagesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userAuthenticationView.userAuthenticationDeleagte = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let self = self else { return }
            if user == nil {
                self.view = self.userAuthenticationView
                
            } else {
                self.view = self.messagesView
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }

}

// MARK: - MessagesViewController

extension MessagesViewController: UserAuthenticationDeleagte {
    func logInAction() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
