//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class ForYouCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
        
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationControllerSetup()
    }
    
    ///View Controller setup to be connected to tabBar
    fileprivate func navigationControllerSetup() {
        let viewController = ForYouViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_ForYou", comment: "")
        viewController.tabBarItem.image = UIImage(named: "for_you_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "for_you_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    public func openSchedule() {
        // To be implemented
    }
    
    public func openGradebook() {
        // To be implemented
    }
    
    public func openUniversityStaffList() {
        // To be implemented
    }
    
    public func openSyllabuss() {
        // To be implemented
    }
    
    public func openUniversityClassCard() {
        // To be implemented
    }
    
    public func openEditPanel() {
        // To be implemented
    }
}
