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
        self.selectedIndex = 0
        
        self.tabBar.backgroundColor = R.color.white500()
    }

}
