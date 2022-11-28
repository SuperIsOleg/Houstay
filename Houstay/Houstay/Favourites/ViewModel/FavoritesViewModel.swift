//
//  FavoritesViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 27.11.22.
//

import Foundation
import FirebaseDatabase

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
                self.preloader.changeIsFavoriteValue(id: id, valuew: false)
                updateFireBaseData(id: id, key: "favorite", value: false)
            }
        }
    }
    
    private func updateFireBaseData(id: String, key: String, value: Bool) {
        let reference = Database.database().reference()
        let appartmentReference = reference.child("appartements").child(id)
        appartmentReference.updateChildValues([key : value])
    }
}
