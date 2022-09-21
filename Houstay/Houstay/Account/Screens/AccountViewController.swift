//
//  AccountViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {
    
    private let accountView = AccountView()
    private let accountViewModel = AccountViewModel()
    private lazy var accountCollectionView = accountView.getAccountCollectionView()
    private var dataSource: UICollectionViewDiffableDataSource<AccountSectionEnum, SettingsItemsModel>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureDataSource()
    }
    
    private func setupLayout() {
        accountView.accountViewDelegate = self
        accountCollectionView.delegate = self
        accountView.setNameUserAndEmailLabel(userName: accountViewModel.name,
                                             email: accountViewModel.email)
        
        self.view.backgroundColor = R.color.white500()
        view.addSubview(accountView)
        accountView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    /// - Tag: CellRegistration
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<AccountCell, SettingsItemsModel> { (cell, indexPath, item) in
            cell.configure(self.accountViewModel.settingsItemsModel[indexPath.row])
        }

        dataSource = UICollectionViewDiffableDataSource<AccountSectionEnum, SettingsItemsModel>(collectionView: accountCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: SettingsItemsModel) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<AccountSectionEnum, SettingsItemsModel>()
        snapshot.appendSections([.settings])
        snapshot.appendItems(self.accountViewModel.settingsItemsModel)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - AccountViewDelegate

extension AccountViewController: AccountViewDelegate {
    func exitAction() {
        do {
            try  Auth.auth().signOut()
        } catch {
            print("Error")
        }
    }
}

// MARK: - UICollectionViewDelegate

extension AccountViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            print(indexPath)
        }
    }
    
}

