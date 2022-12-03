//
//  Date+Extensions.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 4.12.22.
//

import Foundation

extension Date {
    func convertToString() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter.string(from: self)
    }
}
