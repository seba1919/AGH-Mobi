//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class SettingsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.tintColor = .mainRed
        
        let viewController = SettingsViewController()
        viewController.coordinator = self
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Settings", comment: "")
        viewController.tabBarItem.image = UIImage(named: "settings_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "settings_active")
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    func showAboutUs(){
        let child = AboutUsCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func openUPEL() {
        // To be implemented
    }
    
    func openNetworkServicesPanel() {
        // To be implemented
    }
    
    func signOut() {
        let child = LoginPageCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}
