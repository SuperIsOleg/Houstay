//
//  AccountViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 9.09.22.
//

import Foundation
import Firebase

class AccountViewModel {
    internal let keychainManager = KeychainManager.shared
    internal var settingsItemsModel = [SettingsItemsModel]()
    internal var name: String = ""
    internal var email: String = ""
    
    private func setLanguageText() -> String {
        guard let language = UserDefaults.standard.string(forKey: UserDefaultsKey.language.rawValue) else {
            return Bundle.main.preferredLocalizations[0]
        }
        return language
    }
    
    init() {
        settingsItemsModel = [SettingsItemsModel(imageSettings: R.image.information() ?? UIImage(),
                                                 title: R.string.localizable.accountProfile(),
                                                 imageArrows: R.image.arrowsRight() ?? UIImage(),
                                                 switchSounds: true,
                                                 language: ""),
                              SettingsItemsModel(imageSettings: R.image.lock() ?? UIImage(),
                                                 title: R.string.localizable.accountPassword(),
                                                 imageArrows: R.image.arrowsRight() ?? UIImage(),
                                                 switchSounds: true,
                                                 language: ""),
                              SettingsItemsModel(imageSettings: R.image.ring() ?? UIImage(),
                                                 title: R.string.localizable.accountNotify(),
                                                 imageArrows: UIImage(),
                                                 switchSounds: false,
                                                 language: ""),
                              SettingsItemsModel(imageSettings: R.image.globus() ?? UIImage(),
                                                 title: R.string.localizable.accountLanguage(),
                                                 imageArrows: R.image.arrowsDown() ?? UIImage(),
                                                 switchSounds: true,
                                                 language: setLanguageText()),
                              SettingsItemsModel(imageSettings: R.image.policyAndPrivacy() ?? UIImage(),
                                                 title: R.string.localizable.accountPolicyAndPrivacy(),
                                                 imageArrows: R.image.arrowsRight() ?? UIImage(),
                                                 switchSounds: true,
                                                 language: ""),
                              SettingsItemsModel(imageSettings: R.image.aboutUs() ?? UIImage(),
                                                 title: R.string.localizable.accountAboutApp(),
                                                 imageArrows: R.image.arrowsRight() ?? UIImage(),
                                                 switchSounds: true,
                                                 language: "")
        ]
        
        guard let userName = Auth.auth().currentUser?.displayName,
              let userEmail = Auth.auth().currentUser?.email else  { return }
        self.name = userName
        self.email = userEmail
    }
}
