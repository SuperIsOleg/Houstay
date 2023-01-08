//
//  SearchResultsViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 8.01.23.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

// MARK: - UISearchResultsUpdating Delegate
extension SearchResultsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
    }
}
