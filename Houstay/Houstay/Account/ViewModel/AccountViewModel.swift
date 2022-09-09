//
//  AccountViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 9.09.22.
//

import Foundation
import Firebase

class AccountViewModel {
    var name: String = ""
    var email: String = ""
    
    init() {
        guard let userName = Auth.auth().currentUser?.displayName,
              let userEmail = Auth.auth().currentUser?.email else  { return }
        self.name = userName
        self.email = userEmail
    }
}
