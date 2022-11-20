//
//  HomeViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import Foundation
import Firebase
import FirebaseDatabase

class HomeViewModel {
    let sections = Bundle.main.decode([HomeSectionsModel].self, from: "model.json")
    var arrayAppartmentes = [HomeItemsProtocol]()
    
    init() {
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
        }
    }
}
