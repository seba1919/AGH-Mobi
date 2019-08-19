//
//  TabBarCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 18/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    
    var tabBarController: HomeTabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        tabBarController = HomeTabBarController()
        tabBarController.coordinator = self
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    func start() {
        setupTabBarCoordinators()
    }
    
    
    func setupTabBarCoordinators() {
        let forYouCoordinator = ForYouCoordinator(navigationController: self.navigationController)
        forYouCoordinator.start()
        childCoordinators.append(forYouCoordinator)
        
        let studiesCoordinator = StudiesCoordinator(navigationController: self.navigationController)
        studiesCoordinator.start()
        childCoordinators.append(studiesCoordinator)
        
        let mapsCoordinator = MapsCoordinator(navigationController: self.navigationController)
        mapsCoordinator.start()
        childCoordinators.append(mapsCoordinator)
        
        let informationsCoordinator = InformationsCoordinator(navigationController: self.navigationController)
        informationsCoordinator.start()
        childCoordinators.append(informationsCoordinator)
        
        let settingsCoordinator = SettingsCoordinator(navigationController: self.navigationController)
        settingsCoordinator.start()
        childCoordinators.append(settingsCoordinator)
        
        tabBarController.viewControllers = [forYouCoordinator.rootViewController!,
                                            studiesCoordinator.rootViewController!,
                                            mapsCoordinator.rootViewController!,
                                            informationsCoordinator.rootViewController!,
                                            settingsCoordinator.rootViewController!]
    }
}
