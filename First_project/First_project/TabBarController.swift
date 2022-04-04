//
//  ViewController.swift
//  First_project
//
//  Created by Taras Kyparenko on 23.02.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    // MARK: - add viewControllers to each tabBar sections
    func setupTabBar() {
        
        let feedVC = FeedUINavigationController(rootViewController: FeedViewController())
        let saerchVC = SearchUINavigationController(rootViewController: SearchViewController())
        let profileVC = ProfileUINavigationController(rootViewController: ProfileViewController())
        let favoriteVC = FavoriteUINavigationController(rootViewController: FavoriteViewController())
        let settingsVC = SettingsUINavigationController(rootViewController: SettingsViewController())
        
        viewControllers = [feedVC, saerchVC, profileVC, favoriteVC, settingsVC]
        
        feedVC.title = "Feed"
        saerchVC.title = "Search"
        profileVC.title = "Profile"
        favoriteVC.title = "Favorite"
        settingsVC.title = "Settings"
        
        self.tabBar.tintColor = UIColor.black
    }
}
// MARK: - create viewControllers for each tabBar menu & add icons/after tap icons
class FeedUINavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.image = UIImage(systemName: "house")
        tabBarItem.selectedImage = UIImage(systemName: "house.fill")
    }
}
class SearchUINavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
    }
}
class ProfileUINavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.image = UIImage(systemName: "person")
        tabBarItem.selectedImage = UIImage(systemName: "person.fill")
    }
}
class FavoriteUINavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.image = UIImage(systemName: "star")
        tabBarItem.selectedImage = UIImage(systemName: "star.fill")
    }
}
class SettingsUINavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.image = UIImage(systemName: "gearshape")
        tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
    }
}
