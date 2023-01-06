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
    
    func infoAlert(text: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: text,
                                            message: nil,
                                            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            completion()
        }))
    }
    
    func contactAlert(numberOfTelefon: String) {
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
            self.present(alert, animated: true, completion: nil)
            
        }))
        actionSheet.addAction(UIAlertAction(title: R.string.localizable.alertCancel(),
                                            style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}
