//
//  HomeItemsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 6.09.22.
//

import Foundation

struct HomeItemsModel: HomeItemsProtocol, Codable, Hashable {
    var address: String
    var appartementsId: String
    var avatarLink: String
    var city: String
    var descriptions: String
    var email: String
    var facilities: [String]
    var favorite: Bool
    var imagesLink: [String]
    var numberOfTelefon: String
    var period: String
    var price: Int
    var publicationDate: Date
    var review: [String]
    var userId: String
    var userName: String
    var views: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(String.self, forKey: .address)
        self.appartementsId = try container.decode(String.self, forKey: .appartementsId)
        self.avatarLink = try container.decode(String.self, forKey: .avatarLink)
        self.city = try container.decode(String.self, forKey: .city)
        self.descriptions = try container.decode(String.self, forKey: .descriptions)
        self.email = try container.decode(String.self, forKey: .email)
        self.facilities = try container.decode([String].self, forKey: .facilities)
        self.favorite = try container.decode(Bool.self, forKey: .favorite)
        self.imagesLink = try container.decode([String].self, forKey: .imagesLink)
        self.numberOfTelefon = try container.decode(String.self, forKey: .numberOfTelefon)
        self.period = try container.decode(String.self, forKey: .period)
        self.price = try container.decode(Int.self, forKey: .price)
        self.review = try container.decode([String].self, forKey: .review)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.views = try container.decode(Int.self, forKey: .views)
        
        do {
            self.publicationDate = try container.decode(String.self, forKey: .publicationDate).convertToDate() ?? Date()
        } catch {
            self.publicationDate = Date()
            print(error.localizedDescription)
        }

    }
}
