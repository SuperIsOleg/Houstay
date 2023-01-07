//
//  HomeView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 31.08.22.
//

import UIKit

class HomeView: UIView {
    private lazy var homeCollectionView: HomeCollectionView = {
        let collectionView = HomeCollectionView()
        return collectionView
    }()
    
    internal var getHomeCollectionView: HomeCollectionView { homeCollectionView }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        self.addSubview(homeCollectionView)
        homeCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, enviroment in
            guard let section = SectionType(rawValue: sectionIndex),
                  let self = self else { fatalError("Unknown section") }
            switch section {
            case .allAppartments:
                return self.configureAllAppartmentsSection()
            case .recentlyPostedAppartments:
                return self.configureRecentlyPostedAppartmentsSection()
            case .popularAppartments:
                return self.configurePopularAppartmentsSection()
            }
        }
        homeCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func configureAllAppartmentsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .estimated(232))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 16
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                  heightDimension: .absolute(50.0))
                    let header = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
        
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        return section
        
    }
    
    private func configureRecentlyPostedAppartmentsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                  heightDimension: .absolute(50.0))
                    let header = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16.0
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 16, bottom: 16, trailing: 16)
        
        return section
    }
    
    private func configurePopularAppartmentsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(260))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(16.0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                  heightDimension: .absolute(50.0))
                    let header = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16.0
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 16, bottom: 16, trailing: 16)
        
        return section
    }
    
}
