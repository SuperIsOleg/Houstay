//
//  DescriptionViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 28.11.22.
//

import UIKit

class DescriptionViewController: UIViewController {
    private let descriptionView = DescriptionView()
    private var isFavoriteButtonSelected: Bool = false
    private var appartmentID: String = ""
    private let viewModel: DescriptionViewModel
    
    init(viewModel: DescriptionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.descriptionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionView.getImagesCollectionView.delegate = self
        descriptionView.getImagesCollectionView.dataSource = self
        descriptionView.getImagesCollectionView.register(ImagesCell.self,
                                                         forCellWithReuseIdentifier: ImagesCell.reuseIdentifier)
        configure()
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
    
    private func configure() {
        guard let model = viewModel.descriptionAppatrment else { return }
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

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension DescriptionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let model = viewModel.descriptionAppatrment else { return 0 }
        let images = model.image
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = descriptionView.getImagesCollectionView.dequeueReusableCell(withReuseIdentifier: ImagesCell.reuseIdentifier,
                                                                                     for: indexPath) as? ImagesCell,
              let model = viewModel.descriptionAppatrment else { return UICollectionViewCell() }
        cell.setImage(to: model.image)
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DescriptionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeForItemAt = CGSize(width: collectionView.frame.width,
                                   height: collectionView.frame.height)
        return sizeForItemAt
    }
}
