//
//  ForYouCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 18/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class ForYouCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let viewController = ForYouViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_ForYou", comment: "")
        viewController.tabBarItem.image = UIImage(named: "for_you_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "for_you_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    func start() {

    }
}
