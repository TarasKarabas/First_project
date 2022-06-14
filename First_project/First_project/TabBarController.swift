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
        
        viewControllers = [
            createController(for: LoginViewController(),
                             title: "Profile",
                             image: UIImage(systemName: "person"),
                             selectedImage: UIImage(systemName: "person.fill")),
            createController(for: SearchViewController(),
                             title: "Search",
                             image: UIImage(systemName: "magnifyingglass.circle"),
                             selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")),
            createController(for: FeedViewController(),
                             title: "Feed",
                             image: UIImage(systemName: "house"),
                             selectedImage: UIImage(systemName: "house.fill")),
            createController(for: FavoriteViewController(),
                             title: "Favorite",
                             image: UIImage(systemName: "star"),
                             selectedImage: UIImage(systemName: "star.fill")),
            createController(for: SettingsViewController(),
                             title: "Setings",
                             image: UIImage(systemName: "gearshape"),
                             selectedImage: UIImage(systemName: "gearshape.fill"))
        ]
        self.tabBar.tintColor = AppConstants.buttonblue
    }
    
    private func createController(for rootViewController: UIViewController,
                                  title: String,
                                  image: UIImage?,
                                  selectedImage: UIImage?) -> UIViewController {
        let vC = UINavigationController(rootViewController: rootViewController)
        vC.tabBarItem.title = title
        vC.tabBarItem.image = image
        vC.tabBarItem.selectedImage = selectedImage
        
        return vC
    }
}
