//
//  HomeItemsModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 6.09.22.
//

import Foundation

struct HomeItemsModel: HomeItemsProtocol, Codable, Hashable {
    var id: String
    var address: String
    var city: String
    var price: String
    var image: String
    var favorite: Bool
    var publicationDate: Date
    var descriptions: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.address = try container.decode(String.self, forKey: .address)
        self.city = try container.decode(String.self, forKey: .city)
        self.price = try container.decode(String.self, forKey: .price)
        self.image = try container.decode(String.self, forKey: .image)
        self.favorite = try container.decode(Bool.self, forKey: .favorite)
        self.descriptions = try container.decode(String.self, forKey: .descriptions)
        
        do {
            self.publicationDate = try container.decode(String.self, forKey: .publicationDate).convertToDate() ?? Date()
        } catch {
            self.publicationDate = Date()
            print(error.localizedDescription)
        }
    }
}
