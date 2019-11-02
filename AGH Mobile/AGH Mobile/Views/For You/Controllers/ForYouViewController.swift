//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class ForYouViewController: UIViewController {
    // MARK: - Coordinator
    weak var coordinator: ForYouCoordinator?
    // MARK: - Private properties
    private var forYouView: ForYouView { return view as! ForYouView }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = ForYouView(frame: UIScreen.main.bounds)
    }
    
}
