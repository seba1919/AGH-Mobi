//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class StudiesCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationControllerSetup()
    }
    
    ///View Controller setup to be connected to tabBar
    fileprivate func navigationControllerSetup() {
        navigationController.navigationBar.tintColor = .mainRed
        
        let viewController = StudiesViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Studies", comment: "")
        viewController.tabBarItem.image = UIImage(named: "studies_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "studies_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    public func openUniversityClassCard() {
        // To be implemented
    }
    
    public func openSchedule() {
        // To be implemented
    }
    
    public func openGradebook() {
        // To be implemented
    }
    
    public func openSyllabuss() {
        // To be implemented
    }
    
    public func openUniversityStaffList() {
        // To be implemented
    }
    
    public func openMyCourses() {
        // To be implemented
    }
}
