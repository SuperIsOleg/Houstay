//
//  HomeSectionsProtocol.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 16.11.22.
//

protocol HomeSectionsProtocol {
    var type: SectionType { get set }
    var title: String { get set }
    var items: [HomeItemsModel] { get set }
}
