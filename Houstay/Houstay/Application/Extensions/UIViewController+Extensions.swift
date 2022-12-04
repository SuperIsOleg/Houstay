//
//  UIViewController+Extensions.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 4.12.22.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func contactAlert(in viewController: UIViewController, numberOfTelefon: String) {
        let actionSheet = UIAlertController(title: R.string.localizable.alertContactForCommunication(),
                                            message: numberOfTelefon,
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: R.string.localizable.alertCall(),
                                            style: .default, handler: { _ in
            guard let number = URL(string: "tel://" + numberOfTelefon) else { return }
            UIApplication.shared.open(number)
        }))
        actionSheet.addAction(UIAlertAction(title: R.string.localizable.alertCopy(),
                                            style: .default, handler: { _ in
            UIPasteboard.general.string = numberOfTelefon
            let alert = UIAlertController(title: nil,
                                          message: R.string.localizable.alertCopyInBuffer(),
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: R.string.localizable.alertOk(), style: .cancel))
            viewController.present(alert, animated: true, completion: nil)
            
        }))
        actionSheet.addAction(UIAlertAction(title: R.string.localizable.alertCancel(),
                                            style: .cancel, handler: nil))
        viewController.present(actionSheet, animated: true, completion: nil)
    }
    
}
