//
//  HomeSectionsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.09.22.
//

import Foundation

struct HomeSectionsModel: Codable, Hashable {
    let type: HomeSectionEnum
    let title: String
    let items: [HomeItemsModel]
}
