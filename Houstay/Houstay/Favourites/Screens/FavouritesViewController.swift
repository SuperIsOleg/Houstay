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
    
    override func loadView() {
        super.loadView()
        self.view = favouritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        favouritesView.getFavoritesCollectionView.register(PopularAppartmentsCell.self,
                                                           forCellWithReuseIdentifier: PopularAppartmentsCell.reuseIdentifier)
        favouritesView.getFavoritesCollectionView.delegate = self
        favouritesView.getFavoritesCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBar()
        self.configureView()
        self.favouritesView.getFavoritesCollectionView.reloadData()
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
        self.tabBarController?.navigationItem.title = R.string.localizable.favouritesLiked().uppercased()
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavouritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let arrayAppartments = self.viewModel.favoriteAppartmentsArray else { return 0 }
        return arrayAppartments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularAppartmentsCell.reuseIdentifier, for: indexPath) as?
                PopularAppartmentsCell,
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
                self.configureView()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = self.viewModel.favoriteAppartmentsArray else { return }
        let descriptionViewController = DescriptionViewController(viewModel:
                                                                    DescriptionViewModel(descriptionAppatrment: model[indexPath.row]))
        self.navigationController?.pushViewController(descriptionViewController, animated: true)
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

extension FavouritesViewController: FavoritesViewModelDelegate {
    func reloadLobby() {
        favouritesView.getFavoritesCollectionView.reloadData()
    }
}
