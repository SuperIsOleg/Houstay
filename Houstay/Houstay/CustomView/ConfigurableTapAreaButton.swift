//
//  ConfigurableTapAreaButton.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 21.12.22.
//

import UIKit

class ConfigurableTapAreaButton: UIButton {

    var tapRect = CGRect.zero

    override init(frame: CGRect) {
        super.init(frame: frame)
        tapRect = bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return tapRect.contains(point)
    }

    func setTapArea(rect: CGRect) {
        tapRect = rect
    }
 
    func changeTapAreaBy(insets: UIEdgeInsets) {
        let dx = insets.left
        let dy = insets.top
        let dw = insets.right  - dx
        let dh = insets.bottom - dy
        tapRect = CGRect.zero
        tapRect = CGRect(     x: tapRect.origin.x    + dx,
                              y: tapRect.origin.y    + dy,
                          width: tapRect.size.width  + dw,
                         height: tapRect.size.height + dh)
    }
}
