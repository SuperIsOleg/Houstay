//
//  RHomeItemsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 16.11.22.
//

import RealmSwift

class RHomeItemsModel: Object, HomeItemsProtocol {
    
    @Persisted(primaryKey: true) var id: String
    @Persisted var address: String
    @Persisted var city: String
    @Persisted var price: String
    @Persisted var image: String
    @Persisted var favorite: Bool
    @Persisted var publicationDate: Date
    
    convenience init(homeItemsProtocol: HomeItemsProtocol) {
        self.init()
        self.id = homeItemsProtocol.id
        self.address = homeItemsProtocol.address
        self.city = homeItemsProtocol.city
        self.price = homeItemsProtocol.price
        self.image = homeItemsProtocol.image
        self.favorite = homeItemsProtocol.favorite
        self.publicationDate = homeItemsProtocol.publicationDate
    }
}
