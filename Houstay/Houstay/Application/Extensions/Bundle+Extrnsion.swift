//
//  Bundle+Extrnsion.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.09.22.
//

import Foundation

extension Bundle {
    
    public var appVersionShort: String {
            if let result = infoDictionary?["CFBundleShortVersionString"] as? String {
                return result
            } else {
                return "0.0.1"
            }
        }
}
