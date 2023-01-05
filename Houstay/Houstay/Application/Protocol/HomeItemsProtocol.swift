//
//  HomeItemsProtocol.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 16.11.22.
//

import Foundation

protocol HomeItemsProtocol {
    var address: String { get set }
    var appartementsId: String { get set }
    var avatarLink: String { get set }
    var city: String { get set }
    var descriptions: String { get set }
    var email: String { get set }
    var facilities: [String] { get set }
    var favorite: Bool { get set }
    var imagesLink: [String] { get set }
    var numberOfTelefon: String { get set }
    var period: String { get set }
    var price: Int { get set }
    var publicationDate: Date { get set }
    var review: [String] { get set }
    var userId: String { get set }
    var userName: String { get set }
    var views: Int { get set }
}
