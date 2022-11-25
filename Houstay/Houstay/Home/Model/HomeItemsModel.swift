//
//  HomeItemsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 6.09.22.
//

import Foundation

struct HomeItemsModel: HomeItemsProtocol, Codable, Hashable {
    var id: String
    var address: String
    var city: String
    var price: String
    var image: String
    var favorite: Bool
}
