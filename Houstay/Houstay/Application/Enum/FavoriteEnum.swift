//
//  FavoriteEnum.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.09.22.
//

import Foundation
import UIKit

enum FavoriteEnum {
    case tapFavorite
    case didTapFavorite
    
    var image: UIImage? {
        switch self {
        case .tapFavorite:
            return R.image.tapLike()
        case .didTapFavorite:
            return R.image.didTapLike()
        }
    }
}
