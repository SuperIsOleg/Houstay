//
//  UIViewController+Extensions.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

extension UIViewController {
    
    func hiseKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
