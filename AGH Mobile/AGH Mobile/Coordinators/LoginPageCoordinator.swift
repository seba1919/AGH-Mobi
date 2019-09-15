//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class LoginPageCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginPageViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    func signIn() {
        parentCoordinator?.childDidFinish(self)
    }
}
