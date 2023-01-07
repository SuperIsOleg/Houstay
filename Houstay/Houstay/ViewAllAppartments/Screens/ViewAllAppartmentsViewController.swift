//
//  ViewAllAppartmentsViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 7.01.23.
//

import UIKit

class ViewAllAppartmentsViewController: UIViewController {
    private let viewAllAppartmentsView = ViewAllAppartmentsView()
    private let navigationTitle: String
    private let viewModel = ViewAllAppartmentsModel()
    
    init(navigationTitle: ConfigureSectionTitle) {
        switch navigationTitle {
        case .allAppartments:
            self.navigationTitle = R.string.localizable.collectionViewAllAppartments()
        case .popular:
            self.navigationTitle = R.string.localizable.collectionViewPopular()
        case .recentlyPosted:
            self.navigationTitle = R.string.localizable.collectionViewRecentlyPosted()
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = viewAllAppartmentsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        self.viewAllAppartmentsView.getCollectionView.delegate = self
        self.viewAllAppartmentsView.getCollectionView.dataSource = self
        viewAllAppartmentsView.getCollectionView.register(AllAppartmentsCell.self,
                                                          forCellWithReuseIdentifier: AllAppartmentsCell.reuseIdentifier)
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
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: R.color.lnk100() ?? .black,
            NSAttributedString.Key.font: R.font.robotoMedium(size: 20) ?? .systemFont(ofSize: 20)
        ]
        self.navigationItem.title = navigationTitle
        
    }
    
    @objc
    private func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ViewAllAppartmentsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let arrayAppartments = self.viewModel.favoriteAppartmentsArray else { return 0 }
        return arrayAppartments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllAppartmentsCell.reuseIdentifier, for: indexPath) as?
                AllAppartmentsCell,
              let arrayAppartments = self.viewModel.favoriteAppartmentsArray else {
            print("something went wrong")
            return UICollectionViewCell()
        }
        cell.configure(arrayAppartments[indexPath.row])
        cell.closure = { (cell) in
            cell.isButtonSelectedToggle()
            switch cell.getIsButtonSelected {
            case true:
                cell.getFavoriteAppartementButton.setImage(R.image.tapLike(), for: .normal)
                self.viewModel.addFavoriteAppartments(id: cell.getId)
            case false:
                cell.getFavoriteAppartementButton.setImage(R.image.didTapLike(), for: .normal)
                self.viewModel.removeFavoriteAppartments(id: cell.getId)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = self.viewModel.favoriteAppartmentsArray else { return }
        let descriptionViewController = DescriptionViewController(viewModel:
                                                                    DescriptionViewModel(descriptionAppatrment: model[indexPath.row]))
        self.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewAllAppartmentsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sizeForItemAt = CGSize(width: collectionView.frame.width - 32, height: 232)
        return sizeForItemAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

extension ViewAllAppartmentsViewController: ViewAllAppartmentsModelDelegate {
    func reloadLobby() {
        viewAllAppartmentsView.getCollectionView.reloadData()
    }
}
