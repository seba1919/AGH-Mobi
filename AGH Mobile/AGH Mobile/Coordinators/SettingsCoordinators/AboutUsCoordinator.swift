//
//  AboutUsCoordinator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 19/08/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class AboutUsCoordinator: Coordinator {
    weak var parentCoordinator: SettingsCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = AboutAsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showMember() {
        let child = MemberProfileViewCoordinator(navigationController: self.navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    func didFinishWatchingTeamMembersGallery() {
        parentCoordinator?.childDidFinish(self)
    }
}
