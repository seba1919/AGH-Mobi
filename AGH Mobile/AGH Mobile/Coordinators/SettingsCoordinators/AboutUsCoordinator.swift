//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class AboutUsCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    internal func start() {
        let viewModel = AboutUsViewModel(coordinator: self,
                                         api: MembersInfoService())
        let viewController = AboutUsViewController(with: viewModel)
        viewModel.delegate = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Methods to navigate to other ViewControllers
    
    public func show(_ member: Person) {
        let child = MemberProfileViewCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    public func didFinishWatchingTeamMembersGallery() {
        parentCoordinator?.childDidFinish(self)
    }
}
