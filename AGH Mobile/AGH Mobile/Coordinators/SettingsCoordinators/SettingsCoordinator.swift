//
//  SettingsCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 18/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    weak var tabBarCoordinator: TabBarCoordinator?

    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController

    var rootViewController: SettingsViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Initializing rootViewController method
    func start() {
        let vc = SettingsViewController()
        rootViewController = vc
        self.navigationController = UINavigationController(rootViewController: rootViewController!)
        vc.coordinator = self

        vc.tabBarItem.title = NSLocalizedString("TabBar_Settings", comment: "")
        vc.tabBarItem.image = UIImage(named: "settings_inactive")
        vc.tabBarItem.selectedImage = UIImage(named: "settings_active")
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
