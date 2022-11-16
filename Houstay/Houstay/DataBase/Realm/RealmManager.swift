//
//  RealmManager.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 16.11.22.
//

import RealmSwift
import Realm

class RealmManager: RealmManagerProtocol {
    private var realm: Realm?
    static let shared = RealmManager()
    
   private init() {
        do {
            let configuration = Realm.Configuration.defaultConfiguration
            self.realm = try Realm(configuration: configuration)
            print("\nRealm is located at:\n", realm?.configuration.fileURL?.path ?? "")
        } catch let error as NSError {
            print("Realm error: \(error)")
        }
    }
    
    internal func saveObject<T: Object>(_ object: T) {
        guard let realm else { return }
        do {
            try realm.write({
                realm.add(object, update: .all)
            })
        } catch let error as NSError {
            print("Save object: \(error)")
        }
    }
    
    internal func getObject<T: Object>(_ object: T.Type) -> Results<T>? {
        guard let realm else { return nil}
        return realm.objects(T.self)
    }
    
    internal func deleteObject<T: Object>(_ object: T) {
        guard let realm else { return }
        do {
            try realm.write({
                realm.delete(object)
            })
        } catch let error as NSError {
            print("Delete object: \(error)")
        }
    }
    
    internal func deleteAll() {
        guard let realm else { return }
        do {
            try realm.write({
                realm.deleteAll()
            })
        } catch let error as NSError {
            print("Delete object: \(error)")
        }
    }
    
}
