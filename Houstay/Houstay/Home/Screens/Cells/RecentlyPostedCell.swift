//
//  RecentlyPostedCell.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 5.09.22.
//

import UIKit

class RecentlyPostedCell: UICollectionViewCell {
    static var reuseIdentifier = String(describing: RecentlyPostedCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
