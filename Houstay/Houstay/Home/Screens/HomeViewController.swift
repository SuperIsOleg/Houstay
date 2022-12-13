//
//  HomeViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private lazy var homeCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
    private let homeViewModel = HomeViewModel()
//    private var dataSource: UICollectionViewDiffableDataSource<HomeSectionEnum, HomeItemsModel>! = nil
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        homeCollectionView.showsVerticalScrollIndicator = false
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(OffersCell.self, forCellWithReuseIdentifier: OffersCell.reuseIdentifier)
        homeCollectionView.register(RecentlyPostedCell.self, forCellWithReuseIdentifier: RecentlyPostedCell.reuseIdentifier)
        homeCollectionView.register(AllOffersCell.self, forCellWithReuseIdentifier: AllOffersCell.reuseIdentifier)
        homeCollectionView.reloadData()
        setupLayout()
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
            guard let section = HomeSectionEnum(rawValue: sectionIndex) else { fatalError("Unknown section") }
            switch section {
            case .offers:
                return self.createOffersSection()
            case .recentlyPosted:
                return self.createRecentlyPostedSection()
            case .allOffers:
                return self.createAllOffersSection()
            }
        }
        homeCollectionView.setCollectionViewLayout(layout, animated: true)
        
//        createDataSource()
//        reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        homeCollectionView.reloadData()
    }
    
    private func setupLayout() {
        self.view.backgroundColor = R.color.white500()
        homeView.addSubview(homeCollectionView)
        homeCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    
    private func createOffersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .estimated(232))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 16
        
        section.orthogonalScrollingBehavior = .groupPaging
        return section
        
    }
    
    private func createRecentlyPostedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16.0
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 16, bottom: 0, trailing: 16)
        
        return section
    }
    
    private func createAllOffersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(260))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(16.0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16.0
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        return section
    }
    
    //    MARK: - UICollectionViewDiffableDataSource
    
//        private func createDataSource() {
//
//            dataSource = UICollectionViewDiffableDataSource<HomeSectionEnum, HomeItemsModel>(collectionView: homeCollectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
//
//
//
//                guard let section = HomeSectionEnum(rawValue: indexPath.section) else { fatalError("Unknown section") }
//
//                switch section {
//                case .offers:
//                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCell.reuseIdentifier, for: indexPath) as?
//                            OffersCell else {
//                        print("something went wrong")
//                        return UICollectionViewCell()
//                    }
//                    cell.configure(item)
//                    cell.closure = { (cell) in
//                        cell.isButtonSelectedToggle()
//                        switch cell.getIsButtonSelected {
//                        case true:
//                            cell.getFavoriteAppartementButton.setImage(R.image.tapLike(), for: .normal)
//                            self.homeViewModel.addFavoriteAppartments(id: cell.getId)
//                        case false:
//                            cell.getFavoriteAppartementButton.setImage(R.image.didTapLike(), for: .normal)
//                            self.homeViewModel.removeFavoriteAppartments(id: cell.getId)
//                        }
//                    }
//                    return cell
//                case .recentlyPosted:
//                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyPostedCell.reuseIdentifier, for: indexPath) as?
//                            RecentlyPostedCell else {
//                        print("something went wrong")
//                        return UICollectionViewCell()
//                    }
//                    cell.configure(item)
//                    cell.closure = { (cell) in
//                        cell.isButtonSelectedToggle()
//                        switch cell.getIsButtonSelected {
//                        case true:
//                            cell.getFavoriteAppartementButton.setImage(R.image.tapLike(), for: .normal)
//                            self.homeViewModel.addFavoriteAppartments(id: cell.getId)
//                        case false:
//                            cell.getFavoriteAppartementButton.setImage(R.image.didTapLike(), for: .normal)
//                            self.homeViewModel.removeFavoriteAppartments(id: cell.getId)
//                        }
//                    }
//                    return cell
//                case .allOffers:
//                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllOffersCell.reuseIdentifier, for: indexPath) as?
//                            AllOffersCell else {
//                        print("something went wrong")
//                        return UICollectionViewCell()
//                    }
//                    cell.configure(item)
//                    cell.closure = { (cell) in
//                        cell.isButtonSelectedToggle()
//                        switch cell.getIsButtonSelected {
//                        case true:
//                            cell.getFavoriteAppartementButton.setImage(R.image.tapLike(), for: .normal)
//                            self.homeViewModel.addFavoriteAppartments(id: cell.getId)
//                        case false:
//                            cell.getFavoriteAppartementButton.setImage(R.image.didTapLike(), for: .normal)
//                            self.homeViewModel.removeFavoriteAppartments(id: cell.getId)
//                        }
//                    }
//                    return cell
//                }
//            }
//
//        }
//
//        private func reloadData() {
//            var snapshot = NSDiffableDataSourceSnapshot<HomeSectionEnum, HomeItemsModel>()
//            snapshot.appendSections([.offers, .recentlyPosted, .allOffers])
//
//            guard let arrayAppartments = self.homeViewModel.arrayAppartmentes as? [HomeItemsModel] else { return }
//
//            snapshot.appendItems(arrayAppartments, toSection: .offers)
//            snapshot.appendItems(arrayAppartments, toSection: .recentlyPosted)
//            snapshot.appendItems(arrayAppartments, toSection: .allOffers)
//
//            dataSource.apply(snapshot, animatingDifferences: false)
//
//        }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSectionEnum.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let model = homeViewModel.arrayAppartmentes else { return 0 }

        switch HomeSectionEnum(rawValue: section) {
        case .offers:
            return model.count
        case .recentlyPosted:
            return 4
        case .allOffers:
            return 4
        case .none:
            return 0
        }
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let arrayAppartments = self.homeViewModel.arrayAppartmentes,
              let item = arrayAppartments[safe: indexPath.item] else {
            print("something went wrong")
            return UICollectionViewCell()
        }

        switch HomeSectionEnum(rawValue: indexPath.section) {
        case .offers:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCell.reuseIdentifier, for: indexPath) as?
                    OffersCell else {
                print("something went wrong")
                return UICollectionViewCell()
            }
            cell.configure(item)
            cell.closure = { (cell) in
                cell.isButtonSelectedToggle()
                switch cell.getIsButtonSelected {
                case true:
                    cell.getFavoriteAppartementButton.setImage(R.image.tapLike(), for: .normal)
                    self.homeViewModel.addFavoriteAppartments(id: cell.getId)
                case false:
                    cell.getFavoriteAppartementButton.setImage(R.image.didTapLike(), for: .normal)
                    self.homeViewModel.removeFavoriteAppartments(id: cell.getId)
                }
            }
            return cell
        case .recentlyPosted:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyPostedCell.reuseIdentifier, for: indexPath) as?
                    RecentlyPostedCell else {
                print("something went wrong")
                return UICollectionViewCell()
            }
            cell.configure(item)
            cell.closure = { (cell) in
                cell.isButtonSelectedToggle()
                switch cell.getIsButtonSelected {
                case true:
                    cell.getFavoriteAppartementButton.setImage(R.image.tapLike(), for: .normal)
                    self.homeViewModel.addFavoriteAppartments(id: cell.getId)
                case false:
                    cell.getFavoriteAppartementButton.setImage(R.image.didTapLike(), for: .normal)
                    self.homeViewModel.removeFavoriteAppartments(id: cell.getId)
                }
            }
            return cell
        case .allOffers:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllOffersCell.reuseIdentifier, for: indexPath) as?
                    AllOffersCell else {
                print("something went wrong")
                return UICollectionViewCell()
            }
            cell.configure(item)
            cell.closure = { (cell) in
                cell.isButtonSelectedToggle()
                switch cell.getIsButtonSelected {
                case true:
                    cell.getFavoriteAppartementButton.setImage(R.image.tapLike(), for: .normal)
                    self.homeViewModel.addFavoriteAppartments(id: cell.getId)
                case false:
                    cell.getFavoriteAppartementButton.setImage(R.image.didTapLike(), for: .normal)
                    self.homeViewModel.removeFavoriteAppartments(id: cell.getId)
                }
            }
            return cell
        case .none:
            return UICollectionViewCell()
        }
    }

}
