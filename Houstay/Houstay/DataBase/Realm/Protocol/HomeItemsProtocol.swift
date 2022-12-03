//
//  HomeItemsProtocol.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 16.11.22.
//

import Foundation

protocol HomeItemsProtocol {
    var id: String { get set }
    var address: String { get set }
    var city: String { get set }
    var price: String { get set }
    var image: String { get set }
    var favorite: Bool { get set }
    var publicationDate: Date { get set }
    var descriptions: String { get set }
}
