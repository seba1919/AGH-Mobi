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
    
    public var rootViewController: ForYouViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Initializing rootViewController method
    func start() {
        let vc = ForYouViewController()
        rootViewController = vc
        vc.coordinator = self
        vc.tabBarItem.title = NSLocalizedString("TabBar_ForYou", comment: "")
        vc.tabBarItem.image = UIImage(named: "for_you_inactive")
        vc.tabBarItem.selectedImage = UIImage(named: "for_you_active")
    }
}
