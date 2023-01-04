//
//  UserAppartementsProtocol.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.01.23.
//

import Foundation

protocol UserAppartementsProtocol {
    var address: String { get set }
    var appartementsId: Int { get set }
    var city: String { get set }
    var facilities: [String] { get set }
    var price: String { get set }
    var imagesLink: [String] { get set }
    var favorite: Bool { get set }
    var period: String { get set }
    var views: Int { get set }
    var review: [String] { get set }
    var publicationDate: Date { get set }
    var descriptions: String { get set }
}
