//
//  HomeSectionsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.09.22.
//

import Foundation

struct HomeSectionsModel: HomeSectionsProtocol, Codable, Hashable {
    var type: HomeSectionEnum
    var title: String
    var items: [HomeItemsModel]

}
