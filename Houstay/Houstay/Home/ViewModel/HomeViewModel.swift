//
//  HomeViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import Foundation
import Firebase
import FirebaseDatabase

class HomeViewModel {
    internal let sections = Bundle.main.decode([HomeSectionsModel].self, from: "model.json")
    internal var arrayAppartmentes: [HomeItemsProtocol]

    init(arrayAppartmentes: [HomeItemsProtocol]) {
        self.arrayAppartmentes = arrayAppartmentes
    }
}
