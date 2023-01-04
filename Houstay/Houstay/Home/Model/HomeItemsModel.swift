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
    var userAppartements: [UserAppartementsProtocol]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decode(String.self, forKey: .email)
        self.numberOfTelefon = try container.decode(String.self, forKey: .numberOfTelefon)
        self.avatarLink = try container.decode(String.self, forKey: .avatarLink)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.userAppartements = try container.decode([UserAppartementsModel].self, forKey: .userAppartements)
    }
}
