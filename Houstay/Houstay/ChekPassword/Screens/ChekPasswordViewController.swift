//
//  ChekPasswordViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

class ChekPasswordViewController: UIViewController {
    
    private let chekPasswordView = ChekPasswordView()
    
    override func loadView() {
        super.loadView()
        self.view = chekPasswordView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        chekPasswordView.chekPasswordViewDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = R.color.white500()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationController?.navigationBar.tintColor = R.color.lnk100()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.chevronLeft(),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(self.popViewController))
    }
    
    @objc
    private func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
  
    
    internal func setChekPasswordView() -> ChekPasswordView {
        return chekPasswordView
    }
    
}

extension ChekPasswordViewController: ChekPasswordViewDelegate {
    func targetDontGetPasswordAccountAction() {
    }
    
    func continueButtonAction() {
        let createNewPasswordViewController = CreateNewPasswordViewController()
        createNewPasswordViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.navigationBar.tintColor = R.color.blue100()
        self.navigationController?.pushViewController(createNewPasswordViewController, animated: true)
    }
    
    
}
