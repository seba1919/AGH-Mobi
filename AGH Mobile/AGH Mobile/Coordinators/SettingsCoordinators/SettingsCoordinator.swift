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
        let vc = SettingsViewController()
        vc.coordinator = self
        
        vc.tabBarItem.title = NSLocalizedString("TabBar_Settings", comment: "")
        vc.tabBarItem.image = UIImage(named: "settings_inactive")
        vc.tabBarItem.selectedImage = UIImage(named: "settings_active")
        
        navigationController.viewControllers = [vc]
    }

    func start() {
    }
    
    func showTeamMembers(){
        let child = AboutUsCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func signOut() {
        
    }
}
