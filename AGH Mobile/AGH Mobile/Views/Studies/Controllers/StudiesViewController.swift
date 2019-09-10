//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class StudiesViewController: UIViewController {
    
    // MARK: - Instance properties
    weak var coordinator: StudiesCoordinator?
    // Private
    private var studiesView: StudiesView { return view as! StudiesView }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = StudiesView(frame: UIScreen.main.bounds)
    }
    
}
