//
//  PreLoader.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 23.11.22.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol PreLoaderProtocol {
    func getAppartments(completion: @escaping () -> Void)
}

class PreLoader: PreLoaderProtocol {
    private var arrayAppartmentes: [HomeItemsProtocol]?
    private var favoriteAppartmentsArray: [HomeItemsProtocol]?
    private let fairLock = NSLock()
    
    internal static var shared = PreLoader()
    
    private init() {}
    
    private func arrayFilter(array: [HomeItemsModel]) {
        self.favoriteAppartmentsArray = array.filter { object in
            object.favorite == true
        }
    }
    
    internal func getAppartments(completion: @escaping () -> Void){
        let dataBase = Database.database().reference()
        dataBase.child("appartements").observe(.value) { snapshot in
            guard let value = snapshot.value as? [Any] else { return }
            guard let jsonobject = try? JSONSerialization.data(withJSONObject: value) else {
                print("error in serialization")
                return }
            guard let json = try? JSONDecoder().decode([HomeItemsModel].self, from: jsonobject) else {
                print("error in data")
                return
            }
            self.arrayAppartmentes = json
            self.arrayFilter(array: json)
            completion()
        }
        
    }
    
    internal var getArrayAppartmentes: [HomeItemsProtocol] {
        get {
            fairLock.lock()
            defer {
                fairLock.unlock()
            }
            return arrayAppartmentes ?? []
        }
    }
    
    internal var getFavoriteAppartmentsArray: [HomeItemsProtocol] {
        get {
            fairLock.lock()
            defer {
                fairLock.unlock()
            }
            return favoriteAppartmentsArray ?? []
        }
    }
    
    internal func addObjectToFavoriteAppartmentsArray(object: HomeItemsProtocol) {
            self.favoriteAppartmentsArray?.insert(object, at: 0)
    }
    
    internal func removeObjectToFavoriteAppartmentsArray(index: Int) {
        self.favoriteAppartmentsArray?.remove(at: index)
    }
    
}
