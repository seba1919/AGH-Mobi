//
//  StudiesCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 18/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class StudiesCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let vc = StudiesViewController()
        vc.tabBarItem.title = NSLocalizedString("TabBar_Studies", comment: "")
        vc.tabBarItem.image = UIImage(named: "studies_inactive")
        vc.tabBarItem.selectedImage = UIImage(named: "studies_active")
        vc.coordinator = self
        
        navigationController.viewControllers = [vc]
    }
    
    func start() {
    }
}
