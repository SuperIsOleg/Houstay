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
    private let blogViewController = BlogViewController()
    private let accountViewController = AccountViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTabBarItems()
        setTabBarAppearance()
    }
    
    private func prepareTabBarItems() {
        homeViewController.tabBarItem = UITabBarItem(title: nil,
                                                      image: R.image.home(),
                                                      selectedImage: R.image.homeActive())
        favouritesViewController.tabBarItem = UITabBarItem(title: nil,
                                                      image: R.image.favourites(),
                                                      selectedImage: R.image.favouritesActive())
        blogViewController.tabBarItem = UITabBarItem(title: nil,
                                                      image: R.image.blog(),
                                                      selectedImage: R.image.blogActive())
        accountViewController.tabBarItem = UITabBarItem(title: nil,
                                                      image: R.image.account(),
                                                      selectedImage: R.image.accountActive())
        
        self.viewControllers = [
            homeViewController, favouritesViewController, 
            blogViewController, accountViewController
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

    }

}
