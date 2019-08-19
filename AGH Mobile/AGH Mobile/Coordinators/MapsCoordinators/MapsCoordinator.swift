//
//  MapsCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 18/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class MapsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var rootViewController: MapsViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Initializing rootViewController method
    func start() {
        let vc = MapsViewController()
        rootViewController = vc
        vc.coordinator = self
        
        vc.tabBarItem.title = NSLocalizedString("TabBar_Maps", comment: "")
        vc.tabBarItem.image = UIImage(named: "maps_inactive")
        vc.tabBarItem.selectedImage = UIImage(named: "maps_active")
    }
}
