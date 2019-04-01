//
//  HomeTabBarController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor(red: 181/255, green: 101/255, blue: 101/255, alpha: 1)
        
        viewControllers = [createDummyViewController(withTitle: "Dla Ciebie", andImageName: "forYouTabBarIcon", for: ForYouViewController()),
                           createDummyViewController(withTitle: "Studia", andImageName: "studiesTabBarIcon", for: StudiesViewController()),
                           createDummyViewController(withTitle: "Mapy", andImageName: "mapsTabBarIcon", for: MapsViewController()),
                           createDummyViewController(withTitle: "Informacje", andImageName: "informationsTabBarIcon", for: InformationsViewController()),
                           createDummyViewController(withTitle: "Użytkownik", andImageName: "userTabBarIcon", for: UserViewController())]
        
    
        
    }
    
    private func createDummyViewController(withTitle title: String, andImageName imageName: String, for viewController: UIViewController) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        
        return viewController
    }
    
}
