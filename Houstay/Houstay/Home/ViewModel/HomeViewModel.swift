//
//  HomeViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import Foundation
import Firebase

class HomeViewModel {
    var name: String = ""
    
    init() {
        guard let userName = Auth.auth().currentUser?.displayName else { return }
        self.name = userName
    }
}
