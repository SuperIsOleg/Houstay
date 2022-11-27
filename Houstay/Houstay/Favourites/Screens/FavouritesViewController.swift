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
    private let viewModel = FavoritesViewModel()
    private let userAuthenticationView = UserAuthenticationView()
    private var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAuthenticationView.userAuthenticationDeleagte = self
        favouritesView.getFavoritesCollectionView.register(OffersCell.self,
                                                           forCellWithReuseIdentifier: OffersCell.reuseIdentifier)
        favouritesView.getFavoritesCollectionView.delegate = self
        favouritesView.getFavoritesCollectionView.dataSource = self
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
                self.configureView()
                self.favouritesView.getFavoritesCollectionView.reloadData()
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
        appearance.shadowColor = .clear
        appearance.backgroundColor = R.color.white500()
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance =  appearance
        self.navigationController?.navigationBar.compactAppearance =  appearance
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: R.color.lnk100() ?? .black,
            NSAttributedString.Key.font: R.font.robotoMedium(size: 20) ?? .systemFont(ofSize: 20)
        ]
        self.parent?.title = R.string.localizable.favouritesLiked()
    }
    
    private func configureView() {
        guard let favoriteAppartmentsArray = self.viewModel.favoriteAppartmentsArray else {
            return favouritesView.setupFavoritesView(.dontHave)
        }
        
        if favoriteAppartmentsArray.isEmpty {
            favouritesView.setupFavoritesView(.dontHave)
        } else {
            favouritesView.setupFavoritesView(.have)
        }
        
    }
    
}

// MARK: - FavouritesViewController

extension FavouritesViewController: UserAuthenticationDeleagte {
    func logInAction() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavouritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let arrayAppartments = self.viewModel.favoriteAppartmentsArray else { return 0 }
        return arrayAppartments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCell.reuseIdentifier, for: indexPath) as?
                OffersCell,
              let arrayAppartments = self.viewModel.favoriteAppartmentsArray else {
            print("something went wrong")
            return UICollectionViewCell()
        }
        cell.configure(arrayAppartments[indexPath.row])
        cell.closure = { (cell) in
            cell.isButtonSelectedToggle()
            switch cell.getIsButtonSelected {
            case true:
                break
            case false:
                self.viewModel.removeFavoriteAppartments(id: cell.getId)
                self.favouritesView.getFavoritesCollectionView.reloadData()
            }
        }
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavouritesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let sizeForItemAt = CGSize(width: collectionView.frame.width - 32, height: 232)
            return sizeForItemAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 16
    }
}
