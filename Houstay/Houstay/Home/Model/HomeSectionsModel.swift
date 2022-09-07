//
//  HomeSectionsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.09.22.
//

import Foundation

enum HomeSectionEnum: String, Codable {
    case offers = "offers"
    case recentlyPosted = "recently posted"
    case allOffers = "all offers"
}

struct HomeSectionsModel: Codable, Hashable {
    let type: HomeSectionEnum
    let title: String
    let items: [HomeItemsModel]
}
