//
//  RealmManagerProtocol.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 16.11.22.
//

import RealmSwift
import Realm

protocol RealmManagerProtocol {
    func saveObject<T: Object>(_ object: T)
    func getObject<T: Object>(_ object: T.Type) -> Results<T>?
    func deleteObject<T: Object>(_ object: T)
    func deleteAll()
}
