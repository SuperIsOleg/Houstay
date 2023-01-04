//
//  DescriptionViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 3.12.22.
//

import Foundation
import FirebaseDatabase

class DescriptionViewModel {
    private let preloader = PreLoader.shared
    internal var descriptionAppatrment: HomeItemsProtocol?
    
    init(descriptionAppatrment: HomeItemsProtocol) {
        self.descriptionAppatrment = descriptionAppatrment
    }

    internal func addFavoriteAppartments() {
        guard let descriptionAppatrment = descriptionAppatrment else { return }
        let id = descriptionAppatrment.appartementsId
        self.preloader.changeIsFavoriteValue(id: id, valuew: true)
        var favoriteAppartment = self.preloader.getArrayAppartmentes.first { item in
            item.appartementsId == id
        }
        guard var favoriteAppartment else { return }
        favoriteAppartment.favorite = true
        self.preloader.addObjectToFavoriteAppartmentsArray(object: favoriteAppartment)
        updateFireBaseData(id: id, key: "favorite", value: true)
    }
    
    internal func removeFavoriteAppartments() {
        guard let descriptionAppatrment = descriptionAppatrment else { return }
        let id = descriptionAppatrment.appartementsId
        for (index, value) in self.preloader.getFavoriteAppartmentsArray.enumerated() {
            if value.appartementsId == id {
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
