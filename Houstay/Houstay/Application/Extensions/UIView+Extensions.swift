//
//  UIView+Extensions.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 22.11.22.
//

import UIKit

extension UIView {
    var keyWindow: UIWindow? {
        get {
            return UIApplication.shared.connectedScenes
                .first(where: { $0 is UIWindowScene })
                .flatMap({ $0 as? UIWindowScene })?.windows
                .first(where: \.isKeyWindow)
        }
    }
    
    func showLoaderView() {
        let loaderView = LoaderView(frame: frame)
        self.addSubview(loaderView)
    }
    
    func removeLoaderView() {
        if let loaderView = subviews.first(where: { $0 is LoaderView }) {
            loaderView.removeFromSuperview()
        }
    }
}
