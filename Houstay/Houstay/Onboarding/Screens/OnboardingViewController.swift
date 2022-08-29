//
//  ViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.08.22.
//

import UIKit

class OnboardingViewController: UIViewController {
    private let onboardingCollectionView = OnboardingCollectionView()
    private let viewModel = OnboardingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        onboardingCollectionView.reloadData()
    }

    private func setupLayout() {
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        
        self.view.addSubview(onboardingCollectionView)
        onboardingCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension OnboardingViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeForItemAt = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return sizeForItemAt
    }

}
