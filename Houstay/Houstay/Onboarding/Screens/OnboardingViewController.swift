//
//  ViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.08.22.
//

import UIKit

class OnboardingViewController: UIViewController {
    private let onboardingView = OnboardingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    private func setupLayout() {
        self.view.addSubview(onboardingView)
        onboardingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

