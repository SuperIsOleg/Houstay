//
//  SearchResultsViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 8.01.23.
//

import UIKit

class SearchResultsViewController: UIViewController {
    private lazy var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.white500()
        configureSearchController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        self.tabBarController?.tabBar.isHidden = true
    }

    private func configureSearchController() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = R.string.localizable.searchSearch()
        self.definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.showsCancelButton = true
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = R.color.white500()
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationItem.hidesBackButton = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        
    }
}

// MARK: - UISearchResultsUpdating Delegate
extension SearchResultsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension SearchResultsViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationController?.popViewController(animated: true)
    }
}
