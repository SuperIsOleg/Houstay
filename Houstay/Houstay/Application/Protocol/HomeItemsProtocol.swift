//
//  HomeItemsProtocol.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 16.11.22.
//

import Foundation

protocol HomeItemsProtocol {
    var userId: String { get set }
    var email: String { get set }
    var numberOfTelefon: String { get set }
    var avatarLink: String { get set }
    var userName: String { get set }
    var userAppartements: [UserAppartementsProtocol] { get set }
}
