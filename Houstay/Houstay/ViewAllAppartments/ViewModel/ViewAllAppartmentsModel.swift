//
//  ViewAllAppartmentsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 7.01.23.
//

import Foundation
import FirebaseDatabase

protocol ViewAllAppartmentsModelDelegate: AnyObject {
    func reloadLobby()
}


class ViewAllAppartmentsModel {
    private let preloader = PreLoader.shared
    
    internal weak var delegate: ViewAllAppartmentsModelDelegate?
    
    internal var favoriteAppartmentsArray: [HomeItemsProtocol]? {
        get {
            return preloader.getArrayAppartmentes
        }
    }
    
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
