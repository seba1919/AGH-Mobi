//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class AboutUsCoordinator: Coordinator {
    weak var parentCoordinator: SettingsCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = AboutUsViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showMember() {
        let child = MemberProfileViewCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func didFinishWatchingTeamMembersGallery() {
        parentCoordinator?.childDidFinish(self)
    }
}
