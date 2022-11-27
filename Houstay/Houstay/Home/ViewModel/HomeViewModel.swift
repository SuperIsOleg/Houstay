//
//  HomeViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import Foundation

class HomeViewModel {
    private let preloader = PreLoader.shared
    internal let sections = Bundle.main.decode([HomeSectionsModel].self, from: "model.json")
    internal var arrayAppartmentes: [HomeItemsProtocol]?

    init() {
        self.arrayAppartmentes = preloader.getArrayAppartmentes
    }
    
    internal func removeFavoriteAppartments(id: String) {
        
    }
    
    internal func addFavoriteAppartments(id: String) {
    }
}
