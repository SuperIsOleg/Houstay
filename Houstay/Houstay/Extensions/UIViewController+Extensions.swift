//
//  UIViewController+Extensions.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 4.12.22.
//

import UIKit

extension UIViewController {
    func contactAlert(in viewController: UIViewController, numberOfTelefon: String) {
        let actionSheet = UIAlertController(title: R.string.localizable.alertContactForCommunication(),
                                            message: numberOfTelefon,
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: R.string.localizable.alertCall(),
                                            style: .default, handler: { _ in
        }))
        actionSheet.addAction(UIAlertAction(title: R.string.localizable.alertCopy(),
                                            style: .default, handler: { _ in
        }))
        actionSheet.addAction(UIAlertAction(title: R.string.localizable.alertCancel(),
                                            style: .cancel, handler: nil))
        viewController.present(actionSheet, animated: true, completion: nil)
    }
}
