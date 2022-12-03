//
//  DescriptionViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 28.11.22.
//

import UIKit

protocol DescriptionDeleagte: AnyObject {
    func fovoriteTapAction()
}

class DescriptionViewController: UIViewController {
    private let descriptionView = DescriptionView()
    private var isFavoriteButtonSelected: Bool = false
    private var appartmentID: String = ""
    private let viewModel = DescriptionViewModel()
    
    internal weak var descriptionDeleagte: DescriptionDeleagte?
    
    override func loadView() {
        super.loadView()
        self.view = self.descriptionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = R.color.white500()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationController?.navigationBar.tintColor = R.color.lnk100()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.chevronLeft(),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(self.popViewController))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: configureRightBarButtonItem(),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(self.fovoriteTap))
    }
    
    private func configureRightBarButtonItem() -> UIImage {
        switch isFavoriteButtonSelected {
        case true:
            return R.image.tapLikeGray() ?? UIImage()
        case false:
            return R.image.didtTapLikeGray() ?? UIImage()
        }
    }
    
    private func isButtonTogle() {
        if isFavoriteButtonSelected {
            self.isFavoriteButtonSelected = false
        } else {
            self.isFavoriteButtonSelected = true
        }
        self.navigationItem.rightBarButtonItem?.image = configureRightBarButtonItem()
    }
    
    internal func configure(view model: HomeItemsProtocol) {
        self.isFavoriteButtonSelected = model.favorite
        self.appartmentID = model.id
    }
    
    @objc
    private func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func fovoriteTap() {
        isButtonTogle()
        switch isFavoriteButtonSelected {
        case true:
            break
        case false:
            self.viewModel.removeFavoriteAppartments(id: appartmentID)
        }
    }
    
}
