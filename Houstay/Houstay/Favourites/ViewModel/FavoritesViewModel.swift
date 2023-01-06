//
//  FavoritesViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 27.11.22.
//

import Foundation
import FirebaseDatabase

protocol FavoritesViewModelDelegate: AnyObject {
    func reloadLobby()
}

class FavoritesViewModel {
    private let preloader = PreLoader.shared
    
    internal weak var delegate: FavoritesViewModelDelegate?
    
    internal var favoriteAppartmentsArray: [HomeItemsProtocol]? {
        get {
            return preloader.getFavoriteAppartmentsArray
        }
    }
    
    internal func removeFavoriteAppartments(id: String?) {
        guard var id = id else { return }
        for (index, value) in self.preloader.getFavoriteAppartmentsArray.enumerated() {
            if value.appartementsId == id {
                self.preloader.removeObjectToFavoriteAppartmentsArray(index: index)
                self.preloader.changeIsFavoriteValue(id: id, valuew: false)
                updateFireBaseData(id: id, key: "favorite", value: false)
                delegate?.reloadLobby()
            }
        }
    }
    
    private func updateFireBaseData(id: String, key: String, value: Bool) {
        let reference = Database.database().reference()
        let appartmentReference = reference.child("appartements").child(id)
        appartmentReference.updateChildValues([key : value])
    }
}
