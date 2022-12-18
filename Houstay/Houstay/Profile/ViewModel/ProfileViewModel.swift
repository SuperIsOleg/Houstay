//
//  ProfileViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import Foundation
import Firebase
import FirebaseAuth

class ProfileViewModel {
    var name: String = ""
    var email: String = ""
    var phoneNumbers: String = ""
    
    init() {
        guard let currentUser = Auth.auth().currentUser else { return }
        self.name = currentUser.displayName ?? ""
        self.email = currentUser.email ?? ""
        self.phoneNumbers = currentUser.phoneNumber ?? ""
    }
    
    internal func deleteAccount(completion: @escaping () -> Void) {
        guard let currentUser = Auth.auth().currentUser else { return }
        currentUser.delete { error in
            if error == nil {
                completion()
            } else {
                print("Ошибка удаления аккаунта")
            }
        }
    }
}
