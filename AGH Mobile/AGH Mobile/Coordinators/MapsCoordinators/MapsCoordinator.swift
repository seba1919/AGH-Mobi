//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class MapsCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let viewController = MapsViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Maps", comment: "")
        viewController.tabBarItem.image = UIImage(named: "maps_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "maps_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
}
