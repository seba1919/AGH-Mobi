//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class SettingsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    internal func start() {
        let viewModel = SettingsViewModel(coordinator: self)
        let viewController = SettingsViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    public func showAboutUs() {
        let child = AboutUsCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    public func openUPEL() {
        // To be implemented
    }
    
    public func openNetworkServicesPanel() {
        // To be implemented
    }
    
    public func signOut() {
        navigationController.popViewController(animated: true)
        parentCoordinator?.childDidFinish(self)
    }
}
