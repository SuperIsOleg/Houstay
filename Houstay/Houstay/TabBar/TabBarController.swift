//
//  TabBarController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let homeViewController = HomeViewController()
    private let favouritesViewController = FavouritesViewController()
    private let messagesViewController = NewsViewController()
    private let accountViewController = AccountViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTabBarItems()
        setTabBarAppearance()
    }
    
    private func prepareTabBarItems() {
        
        let navigationHomeViewController = UINavigationController(rootViewController: homeViewController)
        let navigationFavouritesViewController = UINavigationController(rootViewController: favouritesViewController)
        let navigationMessagesViewController = UINavigationController(rootViewController: messagesViewController)
        let navigationAccountViewController = UINavigationController(rootViewController: accountViewController)
        
        navigationHomeViewController.tabBarItem = UITabBarItem(title: nil,
                                                     image: R.image.home(),
                                                     selectedImage: R.image.homeActive())
        navigationFavouritesViewController.tabBarItem = UITabBarItem(title: nil,
                                                           image: R.image.favourites(),
                                                           selectedImage: R.image.favouritesActive())
        navigationMessagesViewController.tabBarItem = UITabBarItem(title: nil,
                                                     image: R.image.news(),
                                                     selectedImage: R.image.newsActive())
        navigationAccountViewController.tabBarItem = UITabBarItem(title: nil,
                                                        image: R.image.account(),
                                                        selectedImage: R.image.accountActive())
        
        self.viewControllers = [
            navigationHomeViewController, navigationFavouritesViewController,
            navigationMessagesViewController, navigationAccountViewController
        ]
        
    }
    
    private func setTabBarAppearance() {
        let positionX = 10.0
        let positionY = 10.0
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionX,
                                                          y: tabBar.bounds.minY - positionY,
                                                          width: width, height: height),
                                      cornerRadius: height / 2)
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width
        tabBar.itemPositioning = .centered
        roundLayer.fillColor = R.color.white500()?.cgColor
        
        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundEffect = nil
        tabBar.standardAppearance = appearance
    }
    
}
