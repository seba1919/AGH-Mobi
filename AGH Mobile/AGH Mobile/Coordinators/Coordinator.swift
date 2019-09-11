//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

// Method that removes coordinator from coordinators stack. Should be applied at
extension Coordinator {
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
}

// Make initialization of start method optional
extension Coordinator {
    func start() {}
}
