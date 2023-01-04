//
//  HomeItemsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 6.09.22.
//

import Foundation

struct HomeItemsModel: HomeItemsProtocol, Codable, Hashable {
    var userId: String
    var email: String
    var numberOfTelefon: String
    var avatarLink: String
    var userName: String
    var address: String
    var appartementsId: String
    var city: String
    var facilities: [String]
    var price: Int
    var imagesLink: [String]
    var favorite: Bool
    var period: String
    var views: Int
    var review: [String]
    var publicationDate: Date
    var descriptions: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decode(String.self, forKey: .email)
        self.numberOfTelefon = try container.decode(String.self, forKey: .numberOfTelefon)
        self.avatarLink = try container.decode(String.self, forKey: .avatarLink)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.address = try container.decode(String.self, forKey: .address)
        self.appartementsId = try container.decode(String.self, forKey: .appartementsId)
        self.city = try container.decode(String.self, forKey: .city)
        self.facilities = try container.decode([String].self, forKey: .facilities)
        self.price = try container.decode(Int.self, forKey: .price)
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
