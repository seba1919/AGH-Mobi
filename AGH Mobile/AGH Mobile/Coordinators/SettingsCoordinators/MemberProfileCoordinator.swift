//
//  MemberProfileCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 19/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class MemberProfileViewCoordinator: Coordinator {
    weak var parentCoordinator: AboutUsCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MemberProfileViewController()

        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishStalkingMember() {
        parentCoordinator?.childDidFinish(self)
    }
}
