//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class InformationsCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationControllerSetup()
    }
    
    ///View Controller setup to be connected to tabBar
    fileprivate func navigationControllerSetup() {
        navigationController.navigationBar.tintColor = .mainRed
        
        let viewController = InformationsViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Informations", comment: "")
        viewController.tabBarItem.image = UIImage(named: "info_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "info_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    public func showSyllabus() {
        // To be implemented
    }
    
    public func showUniversityStaff() {
        // To be implemented
    }
    
    public func showStudyRegulations() {
        // To be implemented
    }
}
