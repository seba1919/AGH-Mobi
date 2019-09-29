//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class StudiesCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.tintColor = .mainRed
        
        let viewController = StudiesViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Studies", comment: "")
        viewController.tabBarItem.image = UIImage(named: "studies_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "studies_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    func openUniversityClassCard() {
        // To be implemented
    }
    
    func openSchedule() {
        // To be implemented
    }
    
    func openGradebook() {
        // To be implemented
    }
    
    func openSyllabuss() {
        // To be implemented
    }
    
    func openUniversityStaffList() {
        // To be implemented
    }
    
    func openMyCourses() {
        // To be implemented
    }
}
