//
//  HomeTabBarController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class HomeTabBarController: UITabBarController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupControllers()
        self.setupUI()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupControllers() {
        viewControllers = [createDummyViewController(
                                                     withTitle: "Dla Ciebie",
                                                     andImageName: "forYouTabBarIcon",
                                                     for: ForYouViewController()),
                           createDummyViewController(
                                                     withTitle: "Studia",
                                                     andImageName: "studiesTabBarIcon",
                                                     for: StudiesViewController()),
                           createDummyViewController(
                                                     withTitle: "Mapy",
                                                     andImageName: "mapsTabBarIcon",
                                                     for: MapsViewController()),
                           createDummyViewController(
                                                     withTitle: "Informacje",
                                                     andImageName: "informationsTabBarIcon",
                                                     for: InformationsViewController()),
                           createDummyNavigationController(
                                                           withTitle: "Użytkownik",
                                                           andImageName: "userTabBarIcon",
                                                           for: LoginPageViewController())]
    }
    
    private func setupUI() {
        // TabBar background color
        self.tabBar.backgroundColor = .customLightGray
        // TabBar tint color
        self.tabBar.tintColor = .mainRed
        // Setups for each items in TabBar
        if let items = self.tabBar.items {
            for item in items {
                // Text attributes for normal state
                item.setTitleTextAttributes([
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10.5),
                    NSAttributedString.Key.foregroundColor: UIColor.customDarkGray
                    ], for: .normal)
                // Text attributes for selected state
                item.setTitleTextAttributes([
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10.5),
                    NSAttributedString.Key.foregroundColor: UIColor.mainRed
                    ], for: .selected)
            }
        }
    }
    
}


// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extensions of HomeTabController

extension HomeTabBarController {
    
    private func createDummyViewController(withTitle title: String, andImageName imageName: String, for viewController: UIViewController) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        return viewController
    }
    
    private func createDummyNavigationController(withTitle title: String, andImageName imageName: String, for viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        navigationController.navigationBar.tintColor = .mainRed
        return navigationController
    }
    
}
