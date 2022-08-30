//
//  OnboardingView.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit

protocol OnboardingViewDelegate {
    func nextAction()
}

class OnboardingView: UIView {
    private let onboardingCollectionView: OnboardingCollectionView = {
        let collectionView = OnboardingCollectionView()
        return collectionView
    }()
    
    private let pageControll: UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.currentPageIndicatorTintColor = R.color.blue100()
        pageControll.pageIndicatorTintColor = R.color.white500()
        pageControll.numberOfPages = 3
        pageControll.currentPage = 0
        pageControll.contentMode = .left
        pageControll.contentHorizontalAlignment = .left
        pageControll.isUserInteractionEnabled = false
        return pageControll
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.color.white500()
        button.setImage(R.image.vectorRight(), for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    internal var onboardingViewDelegate: OnboardingViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setIndicatorImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        self.addSubview(onboardingCollectionView)
        onboardingCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        self.addSubview(pageControll)
        pageControll.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.bottom.equalToSuperview().offset(-50)
        }
        
        self.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.width.equalTo(56)
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-24)
        }
        
        nextButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    private func setIndicatorImage() {
        for numbers in 0..<pageControll.numberOfPages {
            pageControll.setIndicatorImage(R.image.whiteRectangle(), forPage: numbers)
        }
    }
    
    @objc
    private func nextTap() {
        onboardingViewDelegate?.nextAction()
    }
    
    internal func getOnboardingCollectionView() -> OnboardingCollectionView {
        return onboardingCollectionView
    }
    
    internal func getPageControll() -> UIPageControl {
        return pageControll
    }
   
}
