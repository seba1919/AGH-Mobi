//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class StudiesViewController: UIViewController {

    // MARK: - Instance Variables
    weak var coordinator: StudiesCoordinator?
    var studiesView: StudiesView { return self.view as! StudiesView }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = StudiesView(frame: UIScreen.main.bounds)
    }
    
}
