//
//  FavoritesViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 27.11.22.
//

import Foundation

class FavoritesViewModel {
    private let preloader = PreLoader.shared
    
    internal var favoriteAppartmentsArray: [HomeItemsProtocol]? {
        get {
            return preloader.getFavoriteAppartmentsArray
        }
    }
    
    internal func removeFavoriteAppartments(id: String) {
        for (index, value) in self.preloader.getFavoriteAppartmentsArray.enumerated() {
            if value.id == id {
                self.preloader.removeObjectToFavoriteAppartmentsArray(index: index)
            }
        }
    }
}
