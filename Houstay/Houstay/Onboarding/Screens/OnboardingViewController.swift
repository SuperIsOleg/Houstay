//
//  ViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.08.22.
//

import UIKit

class OnboardingViewController: UIViewController {
    private let onboardingView = OnboardingView()
    private let viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        onboardingView.getOnboardingCollectionView().reloadData()
    }
    
    private func setupLayout() {
        onboardingView.getOnboardingCollectionView().delegate = self
        onboardingView.getOnboardingCollectionView().dataSource = self
        onboardingView.onboardingViewDelegate = self
        
        view.addSubview(onboardingView)
        onboardingView.snp.makeConstraints {
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
        return viewModel.onboardingSlide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(viewModel.onboardingSlide[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeForItemAt = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return sizeForItemAt
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let screenSize = UIScreen.main.bounds
        let currentPage = Int(scrollView.contentOffset.x / screenSize.width)
        onboardingView.getPageControll().currentPage = currentPage
    }
    
}

// MARK: - OnboardingViewDelegate
extension OnboardingViewController: OnboardingViewDelegate {
    func nextAction() {
        
        if viewModel.onboardingSlide.count - 1 == onboardingView.getPageControll().currentPage {
            print("Push")
        } else {
            onboardingView.getPageControll().currentPage += 1
            onboardingView.getOnboardingCollectionView().isPagingEnabled = false
            let indexPath = IndexPath(row: onboardingView.getPageControll().currentPage, section: 0)
            onboardingView.getOnboardingCollectionView().scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            onboardingView.getOnboardingCollectionView().isPagingEnabled = true
        }
    }
    
}
