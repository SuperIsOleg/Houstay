//
//  AppFlowNavigationControllerViewController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 30.08.22.
//

import UIKit
import Firebase

class AppFlowNavigationController: UINavigationController {
    private let preLoader = PreLoader.shared
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupSplashScreen()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainFlowSetup() {
        if UserDefaults.standard.bool(forKey: "isFirstLaunch") {
                let tabBar = TabBarController(homeViewController:
                                                HomeViewController(homeViewModel:
                                                                    HomeViewModel(arrayAppartmentes:
                                                                                    self.preLoader.getArrayAppartmentes)))
                self.setViewControllers([tabBar], animated: true)
        } else {
            let onboardingViewController = OnboardingViewController()
            self.setViewControllers([onboardingViewController], animated: true)
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
