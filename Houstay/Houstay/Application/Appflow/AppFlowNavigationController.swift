//
//  AppFlowNavigationControllerViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit
import Firebase

class AppFlowNavigationController: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupSplashScreen()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainFlowSetup() {
        if UserDefaults.standard.bool(forKey: "isFirstLaunch") {
            let tabBar = TabBarController()
            self.setViewControllers([tabBar], animated: true)
        } else {
            let onboardingViewController = OnboardingViewController()
            self.setViewControllers([onboardingViewController], animated: false)
        }
        
    }
    
    private func setupSplashScreen() {
        let splashScreenViewController = SplashScreenViewController()
        splashScreenViewController.splashScreenDelegate = self
        self.pushViewController(splashScreenViewController, animated: false)
    }
    
}

extension AppFlowNavigationController: SplashScreenDelegate {
    func setupMainFlow() {
        self.mainFlowSetup()
    }
}
