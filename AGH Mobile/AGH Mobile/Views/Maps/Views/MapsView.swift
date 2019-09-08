//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class MapsView: UIView {
    
    // MARK: - Private properties

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Setup background color to distinguish in TabBar
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
