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
    
    var rootViewController: StudiesViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Initializing rootViewController method
    func start() {
        let vc = StudiesViewController()
        rootViewController = vc
        vc.coordinator = self
        
        vc.tabBarItem.title = NSLocalizedString("TabBar_Studies", comment: "")
        vc.tabBarItem.image = UIImage(named: "studies_inactive")
        vc.tabBarItem.selectedImage = UIImage(named: "studies_active")
    }
}
