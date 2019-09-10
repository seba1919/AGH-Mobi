//
//  InformationsCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 18/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class InformationsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let viewController = InformationsViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Informations", comment: "")
        viewController.tabBarItem.image = UIImage(named: "info_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "info_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }

    func start() {
    }
}
