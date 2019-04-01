//
//  HomeTabBarController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

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
        viewControllers = [createDummyViewController(withTitle: "Dla Ciebie", andImageName: "forYouTabBarIcon", for: ForYouViewController()),
                           createDummyViewController(withTitle: "Studia", andImageName: "studiesTabBarIcon", for: StudiesViewController()),
                           createDummyViewController(withTitle: "Mapy", andImageName: "mapsTabBarIcon", for: MapsViewController()),
                           createDummyViewController(withTitle: "Informacje", andImageName: "informationsTabBarIcon", for: InformationsViewController()),
                           createDummyViewController(withTitle: "Użytkownik", andImageName: "userTabBarIcon", for: UserViewController())]
    }
    
    private func setupUI() {
        self.tabBar.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 0.82)
        self.tabBar.tintColor = UIColor(red: 181/255, green: 101/255, blue: 101/255, alpha: 1)
        if let items = self.tabBar.items {
            for item in items {
                item.setTitleTextAttributes([
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10.5),
                    NSAttributedString.Key.foregroundColor: UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
                    ], for: .normal)
                item.setTitleTextAttributes([
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10.5),
                    NSAttributedString.Key.foregroundColor: UIColor(red: 181/255, green: 101/255, blue: 101/255, alpha: 1)
                    ], for: .selected)
            }
        }
    }
    
    
}

extension HomeTabBarController {
    
    private func createDummyViewController(withTitle title: String, andImageName imageName: String, for viewController: UIViewController) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        return viewController
    }
    
}
