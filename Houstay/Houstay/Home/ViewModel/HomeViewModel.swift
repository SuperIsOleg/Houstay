//
//  HomeViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import Foundation
import FirebaseDatabase

class HomeViewModel {
    private let preloader = PreLoader.shared
    internal var arrayAppartmentes: [HomeItemsProtocol]? {
        get {
            return preloader.getArrayAppartmentes
        }
    }
    
    internal var searchResult: [HomeItemsProtocol]?
    
    internal func removeFavoriteAppartments(id: String) {
        for (index, value) in self.preloader.getFavoriteAppartmentsArray.enumerated() {
            if value.appartementsId == id {
                self.preloader.removeObjectToFavoriteAppartmentsArray(index: index)
                self.preloader.changeIsFavoriteValue(id: id, valuew: false)
                updateFireBaseData(id: id, key: "favorite", value: false)
            }
        }
    }
    
    internal func addFavoriteAppartments(id: String) {
        self.preloader.changeIsFavoriteValue(id: id, valuew: true)
        var favoriteAppartment = self.preloader.getArrayAppartmentes.first { item in
            item.appartementsId == id
        }
        guard var favoriteAppartment else { return }
        favoriteAppartment.favorite = true
        self.preloader.addObjectToFavoriteAppartmentsArray(object: favoriteAppartment)
        updateFireBaseData(id: id, key: "favorite", value: true)
    }
    
    private func updateFireBaseData(id: String, key: String, value: Bool) {
        let reference = Database.database().reference()
        let appartmentReference = reference.child("appartements").child(id)
        appartmentReference.updateChildValues([key : value])
    }
}
