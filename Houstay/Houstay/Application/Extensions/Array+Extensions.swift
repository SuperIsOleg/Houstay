//
//  Array+Extensions.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 21.11.22.
//

extension Array {
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}
