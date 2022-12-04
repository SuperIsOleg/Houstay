//
//  HomeSectionsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.09.22.
//

import Foundation
import FirebaseDatabase


struct HomeSectionsModel: HomeSectionsProtocol, Hashable {
    var type: HomeSectionEnum
    var title: String
    var items: [HomeItemsModel]


}
