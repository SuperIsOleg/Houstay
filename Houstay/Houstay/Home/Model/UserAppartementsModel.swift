//
//  UserAppartementsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.01.23.
//

import Foundation

struct UserAppartementsModel: UserAppartementsProtocol, Codable {
    var address: String
    var appartementsId: Int
    var city: String
    var facilities: [String]
    var price: String
    var imagesLink: [String]
    var favorite: Bool
    var period: String
    var views: Int
    var review: [String]
    var publicationDate: Date
    var descriptions: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(String.self, forKey: .address)
        self.appartementsId = try container.decode(Int.self, forKey: .appartementsId)
        self.city = try container.decode(String.self, forKey: .city)
        self.facilities = try container.decode([String].self, forKey: .facilities)
        self.price = try container.decode(String.self, forKey: .price)
        self.imagesLink = try container.decode([String].self, forKey: .imagesLink)
        self.favorite = try container.decode(Bool.self, forKey: .favorite)
        self.period = try container.decode(String.self, forKey: .period)
        self.views = try container.decode(Int.self, forKey: .views)
        self.review = try container.decode([String].self, forKey: .review)
        self.descriptions = try container.decode(String.self, forKey: .descriptions)
        
        do {
            self.publicationDate = try container.decode(String.self, forKey: .publicationDate).convertToDate() ?? Date()
        } catch {
            self.publicationDate = Date()
            print(error.localizedDescription)
        }
    }
}
