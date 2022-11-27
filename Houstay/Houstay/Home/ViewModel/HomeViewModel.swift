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
                self.preloader.removeObjectToFavoriteAppartmentsArray(index: index)
            }
        }
    }
    
    internal func addFavoriteAppartments(id: String) {
      var favoriteAppartment = self.preloader.getArrayAppartmentes.first { item in
            item.id == id
      }
        
        guard var favoriteAppartment else { return }
        
        favoriteAppartment.favorite = true
        
        self.preloader.addObjectToFavoriteAppartmentsArray(object: favoriteAppartment)
    }
}
