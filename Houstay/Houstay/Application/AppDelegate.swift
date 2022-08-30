//
//  AppDelegate.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.08.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let appFlowNavigationController = AppFlowNavigationController()
        window?.makeKeyAndVisible()
        window?.rootViewController = appFlowNavigationController
        window?.overrideUserInterfaceStyle = .light
        return true
    }
}

