//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class MapsViewController: UIViewController {
    // MARK: - Coordinator
    weak var coordinator:  MapsCoordinator?
    // MARK: - Private properties
    private var mapsView: MapsView { return view as! MapsView }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = MapsView(frame: UIScreen.main.bounds)
    }
    
}
