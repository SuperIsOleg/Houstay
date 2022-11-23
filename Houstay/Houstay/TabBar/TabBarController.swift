//
//  TabBarController.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 2.09.22.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let homeViewController: HomeViewController
    private let favouritesViewController = FavouritesViewController()
    private let messagesViewController = MessagesViewController()
    private let accountViewController = AccountViewController()
    
    init(homeViewController: HomeViewController) {
        self.homeViewController = homeViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        messagesViewController.tabBarItem = UITabBarItem(title: nil,
                                                     image: R.image.message(),
                                                     selectedImage: R.image.messageActive())
        accountViewController.tabBarItem = UITabBarItem(title: nil,
                                                        image: R.image.account(),
                                                        selectedImage: R.image.accountActive())
        
        self.viewControllers = [
            homeViewController, favouritesViewController,
            messagesViewController, accountViewController
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
