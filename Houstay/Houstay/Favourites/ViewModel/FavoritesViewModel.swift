//
//  FavoritesViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 27.11.22.
//

import Foundation

class FavoritesViewModel {
    private let preloader = PreLoader.shared
    internal var favoriteAppartmentsArray: [HomeItemsProtocol]?
    
    init() {
        favoriteAppartmentsArray = preloader.getFavoriteAppartmentsArray
    }
    

}
