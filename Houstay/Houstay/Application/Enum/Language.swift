//
//  Language.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 21.12.22.
//

import Foundation

enum Language: String {
    case none
    case en
    case ru
    case de
    
    var localizedText: String {
        switch self {
        case .none:
            return ""
        case .en:
            return R.string.localizable.accountEnglish()
        case .ru:
            return R.string.localizable.accountRussian()
        case .de:
            return "Deutche"
        }
    }
}
