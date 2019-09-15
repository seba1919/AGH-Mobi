//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

final class ListContentViewController: UIViewController {
    
    // MARK: - Private Properties
    var listContentView: ListContentView { return view as! ListContentView }
    
    override func loadView() {
        view = ListContentView(frame: UIScreen.main.bounds)
    }
}
