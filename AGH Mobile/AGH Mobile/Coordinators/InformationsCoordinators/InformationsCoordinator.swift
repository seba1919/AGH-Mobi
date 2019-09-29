//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class InformationsCoordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.tintColor = .mainRed
        
        let viewController = InformationsViewController()
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Informations", comment: "")
        viewController.tabBarItem.image = UIImage(named: "info_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "info_active")
        viewController.coordinator = self
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    func showSyllabus() {
        // To be implemented
    }
    
    func showUniversityStaff() {
        // To be implemented
    }
    
    func showStudyRegulations() {
        // To be implemented
    }
}
