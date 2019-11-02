//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class MemberProfileViewCoordinator: Coordinator {
    weak var parentCoordinator: AboutUsCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    internal func start() {
        let viewController = MemberProfileViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func didFinishWatchingMember() {
        parentCoordinator?.childDidFinish(self)
    }
}
