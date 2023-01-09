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
    private var handle: AuthStateDidChangeListenerHandle?
    
    override func loadView() {
        super.loadView()
        self.view = accountView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.white500()
        accountView.accountViewDelegate = self
        accountView.getAccountTableView.delegate = self
        accountView.getAccountTableView.dataSource = self
        accountView.getAccountTableView.register(AccountCell.self, forCellReuseIdentifier: AccountCell.reuseIdentifier)
        userAuthenticationView.userAuthenticationDeleagte = self
        accountView.setNameUserAndEmailLabel(userName: accountViewModel.name,
                                             email: accountViewModel.email)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = false
        
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
    
}

// MARK: - AccountViewDelegate

extension AccountViewController: FooterViewDelegate {
    func exitAction() {
        do {
            try  Auth.auth().signOut()
        } catch {
            print("Error")
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.settingsItemsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = accountView.getAccountTableView.dequeueReusableCell(withIdentifier: AccountCell.reuseIdentifier,
                                                                             for: indexPath) as? AccountCell else { return UITableViewCell() }
        cell.configure(self.viewModel.settingsItemsModel[indexPath.row])
        
        if indexPath.row == 3 {
            let languageRussian = UIAction(title: R.string.localizable.accountRussian(),
                                           image: R.image.russian()) { (_) in
                cell.getLanguageLabelText(R.string.localizable.accountRussian())
            }
            
            let languageEnglish = UIAction(title: R.string.localizable.accountEnglish(),
                                           image: R.image.english()) { (_) in
                cell.getLanguageLabelText(R.string.localizable.accountEnglish())
            }
            cell.getArrowButton.showsMenuAsPrimaryAction = true
            cell.getArrowButton.menu = UIMenu(title: R.string.localizable.accountChooseLanguage(), children: [languageRussian, languageEnglish])
            cell.configureTapAreaButton()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = FooterView()
        footer.footerViewDelegate = self
        return footer
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension AccountViewController: UserAuthenticationDeleagte {
    func logInAction() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}

// MARK: - AccountViewDelegate

extension AccountViewController: AccountViewDelegate {
    func changePhotoAction() {
        let photoPicker = UIImagePickerController()
        photoPicker.allowsEditing = true
        photoPicker.delegate = self
        photoPicker.sourceType = .photoLibrary
        present(photoPicker, animated: true)
    }
    
}

extension AccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage,
              let data = image.jpegData(compressionQuality: 1) else { return }
        self.accountView.getAccountImage.image = UIImage(data: data)
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}
