//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class ForYouViewController: UIViewController {

    // MARK: - Private properties
    private var forYouView: GradesView { return view as! GradesView }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = GradesView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.forYouView.setupUI()

    }
    
}
