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
        for (index, value) in self.preloader.getFavoriteAppartmentsArray.enumerated() {
            if value.id == id {
                self.preloader.getFavoriteAppartmentsArray.remove(at: index)
            }
        }
    }
    
    internal func addFavoriteAppartments(id: String) {
      let favoriteAppartments = self.preloader.getArrayAppartmentes.first { item in
            item.id == id
        }
        guard let favoriteAppartments else { return }
        self.preloader.getFavoriteAppartmentsArray.insert(favoriteAppartments, at: 0)
    }
}
