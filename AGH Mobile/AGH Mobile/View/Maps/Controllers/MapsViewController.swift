//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class MapsViewController: UIViewController {

    // MARK: - Instance Variables
    weak var coordinator: MapsCoordinator?
    var mapsView: MapsView { return self.view as! MapsView }

    // MARK: - Lifecycle
    override func loadView() {
        self.view = MapsView(frame: UIScreen.main.bounds)
    }
    
}
