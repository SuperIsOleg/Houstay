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
    private lazy var homeCollectionView = self.homeView.getHomeCollectionView
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
        homeCollectionView.register(SectionHeaderView.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: SectionHeaderView.reuseIdentifier)
        homeCollectionView.register(OffersCell.self, forCellWithReuseIdentifier: OffersCell.reuseIdentifier)
        homeCollectionView.register(RecentlyPostedCell.self, forCellWithReuseIdentifier: RecentlyPostedCell.reuseIdentifier)
        homeCollectionView.register(AllOffersCell.self, forCellWithReuseIdentifier: AllOffersCell.reuseIdentifier)
        homeCollectionView.reloadData()
//        createDataSource()
//        reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        homeCollectionView.reloadData()
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
        case .popular:
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
        case .popular:
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let arrayAppartments = self.homeViewModel.arrayAppartmentes else { return }
        let descriptionViewController = DescriptionViewController(viewModel:
                                                                    DescriptionViewModel(descriptionAppatrment: arrayAppartments[indexPath.row]))
        
        switch HomeSectionEnum(rawValue: indexPath.section) {
        case .allOffers:
            self.navigationController?.pushViewController(descriptionViewController, animated: true)
        case .popular:
            self.navigationController?.pushViewController(descriptionViewController, animated: true)
        case .recentlyPosted:
            self.navigationController?.pushViewController(descriptionViewController, animated: true)
        case .none:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard let header = collectionView.dequeueReusableSupplementaryView(
         ofKind: UICollectionView.elementKindSectionHeader,
         withReuseIdentifier: SectionHeaderView.reuseIdentifier,
         for: indexPath
        ) as? SectionHeaderView else { return UICollectionReusableView() }

        switch HomeSectionEnum(rawValue: indexPath.section) {
        case .allOffers:
            header.setTitle(configure: .allAppartments)
        case .popular:
            header.setTitle(configure: .popular)
        case .recentlyPosted:
            header.setTitle(configure: .recentlyPosted)
        case .none:
            break
        }
        return header
    }
    
}
