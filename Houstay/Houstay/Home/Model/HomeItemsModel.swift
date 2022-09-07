//
//  HomeItemsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 6.09.22.
//

import Foundation

struct HomeItemsModel: Codable, Hashable {
    let id: String
    let address: String
    let city: String
    let price: String
    let image: String
}
