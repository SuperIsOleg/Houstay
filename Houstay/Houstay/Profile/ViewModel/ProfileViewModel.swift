//
//  ProfileViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.09.22.
//

import Foundation
import Firebase

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
}
