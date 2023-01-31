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
    private lazy var searchController = UISearchController(searchResultsController: nil)
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(SectionHeaderView.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: SectionHeaderView.reuseIdentifier)
        homeCollectionView.register(PopularAppartmentsCell.self, forCellWithReuseIdentifier: PopularAppartmentsCell.reuseIdentifier)
        homeCollectionView.register(RecentlyPostedAppartmentsCell.self, forCellWithReuseIdentifier: RecentlyPostedAppartmentsCell.reuseIdentifier)
        homeCollectionView.register(AllAppartmentsCell.self, forCellWithReuseIdentifier: AllAppartmentsCell.reuseIdentifier)
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        self.tabBarController?.tabBar.isHidden = false
        homeCollectionView.reloadData()
    }
    
    private func configureSearchController() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = R.string.localizable.searchSearch()
        self.definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = R.color.white500()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.titleView = searchController.searchBar
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let model = homeViewModel.arrayAppartmentes else { return 0 }
        
        switch SectionType(rawValue: section) {
        case .popularAppartments:
            return model.count
        case .recentlyPostedAppartments:
            return 4
        case .allAppartments:
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
        
        switch SectionType(rawValue: indexPath.section) {
        case .popularAppartments:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularAppartmentsCell.reuseIdentifier, for: indexPath) as?
                    PopularAppartmentsCell else {
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
        case .recentlyPostedAppartments:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyPostedAppartmentsCell.reuseIdentifier, for: indexPath) as?
                    RecentlyPostedAppartmentsCell else {
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
        case .allAppartments:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllAppartmentsCell.reuseIdentifier, for: indexPath) as?
                    AllAppartmentsCell else {
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
        
        switch SectionType(rawValue: indexPath.section) {
        case .allAppartments:
            self.navigationController?.pushViewController(descriptionViewController, animated: true)
        case .popularAppartments:
            self.navigationController?.pushViewController(descriptionViewController, animated: true)
        case .recentlyPostedAppartments:
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
        
        
        
        switch SectionType(rawValue: indexPath.section) {
        case .allAppartments:
            header.setTitle(configure: .allAppartments)
            header.closure = {
                let viewAllAppartmentsViewController = ViewAllAppartmentsViewController(navigationTitle: .allAppartments)
                self.navigationController?.pushViewController(viewAllAppartmentsViewController, animated: true)
            }
        case .popularAppartments:
            header.setTitle(configure: .popular)
            header.closure = {
                let viewAllAppartmentsViewController = ViewAllAppartmentsViewController(navigationTitle: .popular)
                self.navigationController?.pushViewController(viewAllAppartmentsViewController, animated: true)
            }
        case .recentlyPostedAppartments:
            header.setTitle(configure: .recentlyPosted)
            header.closure = {
                let viewAllAppartmentsViewController = ViewAllAppartmentsViewController(navigationTitle: .recentlyPosted)
                self.navigationController?.pushViewController(viewAllAppartmentsViewController, animated: true)
            }
        case .none:
            break
        }
        return header
    }
    
}

// MARK: - UISearchControllerDelegate
extension HomeViewController: UISearchControllerDelegate {
    
    func presentSearchController(_ searchController: UISearchController) {
        self.tabBarController?.tabBar.isHidden = true
        let searchView = HistorySearchView()
        self.view = searchView
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.tabBarController?.tabBar.isHidden = false
        self.view = homeView
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.tabBarController?.tabBar.isHidden = true
        guard let searchResult = self.homeViewModel.searchResult else {
            let noResultView = NoResultView()
            self.view = noResultView
            return
        }
        let resultView = ResultCollectionView()
        self.view = resultView
    }
}
