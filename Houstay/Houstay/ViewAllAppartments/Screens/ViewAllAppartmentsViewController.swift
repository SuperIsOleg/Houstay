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
