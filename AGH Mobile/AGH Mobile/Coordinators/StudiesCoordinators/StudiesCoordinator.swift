//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class StudiesCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let viewController = StudiesViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Studies", comment: "")
        viewController.tabBarItem.image = UIImage(named: "studies_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "studies_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
}
