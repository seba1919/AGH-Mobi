//
//  SettingsCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 18/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let viewController = SettingsViewController()
        viewController.coordinator = self
        
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Settings", comment: "")
        viewController.tabBarItem.image = UIImage(named: "settings_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "settings_active")
        
        navigationController.viewControllers = [viewController]
    }

    func start() {
    }
    
    func showTeamMembers() {
        let child = AboutUsCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func signOut() {
        
    }
}
