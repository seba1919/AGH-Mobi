//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class ForYouViewController: UIViewController {
    
    // MARK: - Instance Variables
    weak var coordinator: ForYouCoordinator?
    var forYouView: ForYouView { return self.view as! ForYouView }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = ForYouView(frame: UIScreen.main.bounds)
    }
    
}
