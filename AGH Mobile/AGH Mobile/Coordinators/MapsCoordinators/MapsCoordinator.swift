//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class MapsCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.tintColor = .mainRed
        
        let viewController = MapsViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Maps", comment: "")
        viewController.tabBarItem.image = UIImage(named: "maps_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "maps_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    func showBuilding() {
        // To be implemented
    }
}
