//
//  UIString+Extensions.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 25.11.22.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.date(from: self)
    }
}
