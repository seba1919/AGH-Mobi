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
                           createDummyViewController(
                                                     withTitle: "Użytkownik",
                                                     andImageName: "userTabBarIcon",
                                                     for: UserViewController())]
    }
    
    private func setupUI() {
        // TabBar background color
        self.tabBar.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 0.82)
        // TabBar tint color
        self.tabBar.tintColor = UIColor(red: 181/255, green: 101/255, blue: 101/255, alpha: 1)
        // Setups for each items in TabBar
        if let items = self.tabBar.items {
            for item in items {
                // Text attributes for normal state
                item.setTitleTextAttributes([
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10.5),
                    NSAttributedString.Key.foregroundColor: UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
                    ], for: .normal)
                // Text attributes for selected state
                item.setTitleTextAttributes([
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10.5),
                    NSAttributedString.Key.foregroundColor: UIColor(red: 181/255, green: 101/255, blue: 101/255, alpha: 1)
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
    
}
