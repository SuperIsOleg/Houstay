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
    private lazy var homeCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: self.createCompositionalLayout())
    private let homeViewModel = HomeViewModel()
    private lazy var sections = self.homeViewModel.sections
    private var dataSource: UICollectionViewDiffableDataSource<HomeSectionsModel, HomeItemsModel>! = nil
    
    var count = [HomeItemsModel]()
    
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
        
        //                createDataSource()
        //                reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeCollectionView.reloadData()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil}
            let section = self.sections[sectionIndex]
            
            switch section.type {
            case .offers:
                return self.createOffersSection()
            case .recentlyPosted:
                return self.createRecentlyPostedSection()
            case .allOffers:
                return self.createAllOffersSection()
            }
        }
        return layout
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
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<HomeSectionsModel, HomeItemsModel>(collectionView: homeCollectionView, cellProvider: { (collectionView, indexPath, model) ->  UICollectionViewCell? in
            
            switch self.sections[indexPath.section].type {
                
            case .offers:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCell.reuseIdentifier, for: indexPath) as?
                        OffersCell else { return UICollectionViewCell() }
                
                cell.layer.cornerRadius = 12
                cell.backgroundColor = R.color.white500()
                cell.configure(model)
                return cell
            case .recentlyPosted:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyPostedCell.reuseIdentifier, for: indexPath) as?
                        RecentlyPostedCell else { return UICollectionViewCell() }
                
                cell.layer.cornerRadius = 12
                cell.backgroundColor = R.color.blue80()
                cell.configure(model)
                return cell
            case .allOffers:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllOffersCell.reuseIdentifier, for: indexPath) as?
                        AllOffersCell else { return UICollectionViewCell() }
                
                cell.layer.cornerRadius = 12
                cell.backgroundColor = R.color.lnk50()
                cell.configure(model)
                return cell
            }
        })
        
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSectionsModel, HomeItemsModel>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource?.apply(snapshot)
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeViewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch self.sections[section].type {
        case .offers:
            return homeViewModel.sections[section].items.count
        case .recentlyPosted:
            return 4
        case .allOffers:
            return 4
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = sections[indexPath.section]
        guard let arrayAppartments = self.homeViewModel.arrayAppartmentes,
              let item = arrayAppartments[safe: indexPath.item] else {
            print("something went wrong")
            return UICollectionViewCell()
        }
        
        switch section.type {
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
        }
    }
    
}
