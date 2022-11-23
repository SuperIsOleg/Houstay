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
    internal static var shared = PreLoader()
    private var arrayAppartmentes: [HomeItemsProtocol] = []
    private let fairLock = NSLock()
    
    private init() {}
    
    internal func getAppartments(completion: @escaping () -> Void){
        let dataBase = Database.database().reference()
        dataBase.child("appartements").observe(.value) { snapshot in
            guard let value = snapshot.value as? [Any] else { return }
            for values in value {
                guard let jsonobject = try? JSONSerialization.data(withJSONObject: values) else {
                    print("error in serialization")
                    return }
                guard let json = try? JSONDecoder().decode(HomeItemsModel.self, from: jsonobject) else {
                    print("error in data")
                    return }
                self.arrayAppartmentes.append(json)
            }
            completion()
        }
        
    }
    
    internal var getArrayAppartmentes: [HomeItemsProtocol] {
        get {
            fairLock.lock()
            defer {
                fairLock.unlock()
            }
            return arrayAppartmentes
        }
    }
    
}
