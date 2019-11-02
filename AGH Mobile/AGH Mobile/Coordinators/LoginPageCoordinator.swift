//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class LoginPageCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
        
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationControllerSetup()
    }
    
    internal func start() {
        let viewController = LoginPageViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    ///View Controller setup to be connected to tabBar
    fileprivate func navigationControllerSetup() {
        navigationController.navigationBar.tintColor = .mainRed
        
        let viewController = LoginPageViewController()
        viewController.coordinator = self
        viewController.tabBarItem.title = NSLocalizedString("TabBar_Settings", comment: "")
        viewController.tabBarItem.image = UIImage(named: "settings_inactive")
        viewController.tabBarItem.selectedImage = UIImage(named: "settings_active")
        
        navigationController.viewControllers = [viewController]
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    public func signIn() {
        let child = SettingsCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    public func showAboutUs() {
        let child = AboutUsCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}
