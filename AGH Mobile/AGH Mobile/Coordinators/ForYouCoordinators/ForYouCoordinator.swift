//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class ForYouCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let viewController = ForYouViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_ForYou", comment: "")
        viewController.tabBarItem.image = UIImage(named: "for_you_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "for_you_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    func openSchedule() {
        // To be implemented
    }
    
    func openGradebook() {
        // To be implemented
    }
    
    func openUniversityStaffList() {
        // To be implemented
    }
    
    func openSyllabuss() {
        // To be implemented
    }
    
    func openUniversityClassCard() {
        // To be implemented
    }
    
    func openEditPanel() {
        // To be implemented
    }
}
