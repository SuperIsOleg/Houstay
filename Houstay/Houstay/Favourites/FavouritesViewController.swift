//
//  FavouritesViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit
import Firebase

class FavouritesViewController: UIViewController {
    private let favouritesView = FavouritesView()
    private let userAuthenticationView = UserAuthenticationView()
    private var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAuthenticationView.userAuthenticationDeleagte = self
        favouritesView.setupFavouritesView(.dontHave)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let self = self else { return }
            if user == nil {
                self.view = self.userAuthenticationView
            } else {
                self.view = self.favouritesView
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }

    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = R.color.white500()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: R.color.lnk100() ?? .black,
            NSAttributedString.Key.font: R.font.robotoMedium(size: 20) ?? .systemFont(ofSize: 20)
        ]
        self.navigationItem.title = R.string.localizable.favouritesLiked()
    }
    
}

// MARK: - FavouritesViewController

extension FavouritesViewController: UserAuthenticationDeleagte {
    func logInAction() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
