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
    private let userAuthenticationView = UserAuthenticationView()
    private let viewModel = AccountViewModel()
    private lazy var accountCollectionView = accountView.getAccountCollectionView()
    private var dataSource: UICollectionViewDiffableDataSource<AccountSectionEnum, SettingsItemsModel>! = nil
    private var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountView.accountViewDelegate = self
        accountCollectionView.delegate = self
        userAuthenticationView.userAuthenticationDeleagte = self
        accountView.setNameUserAndEmailLabel(userName: accountViewModel.name,
                                             email: accountViewModel.email)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        configureDataSource()
        handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let self = self else { return }
            if user == nil {
                self.view = self.userAuthenticationView
            } else {
                self.view = self.accountView
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }

    /// - Tag: CellRegistration
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<AccountCell, SettingsItemsModel> { (cell, indexPath, item) in
            cell.configure(self.accountViewModel.settingsItemsModel[indexPath.row])
            if indexPath.row == 3 {
                
                let languageRussian = UIAction(title: R.string.localizable.accountRussian(),
                                               image: R.image.russian()) { (_) in
                    cell.getLanguageLabelText(R.string.localizable.accountRussian())
                }
                
                let languageEnglish = UIAction(title: R.string.localizable.accountEnglish(),
                                               image: R.image.english()) { (_) in
                    cell.getLanguageLabelText(R.string.localizable.accountEnglish())
                }
                cell.arrowButton.showsMenuAsPrimaryAction = true
                cell.arrowButton.menu = UIMenu(title: R.string.localizable.accountChooseLanguage(), children: [languageRussian, languageEnglish])
            }
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
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ProfileViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(PasswordViewController(), animated: true)
        case 2:
            break
        case 3:
            break
        case 4:
            self.navigationController?.pushViewController(PolicyAndPrivacyViewController(), animated: true)
        case 5:
            self.navigationController?.pushViewController(AboutAppViewController(), animated: true)
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDelegate

extension AccountViewController: UserAuthenticationDeleagte {
    func logInAction() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
