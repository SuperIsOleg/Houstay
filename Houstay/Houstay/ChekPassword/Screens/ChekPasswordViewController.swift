//
//  ChekPasswordViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

class ChekPasswordViewController: UIViewController {
    
    private let chekPasswordView = ChekPasswordView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupLayout() {
        self.view.addSubview(chekPasswordView)
        chekPasswordView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    internal func setChekPasswordView() -> ChekPasswordView {
        return chekPasswordView
    }
    
    
}
