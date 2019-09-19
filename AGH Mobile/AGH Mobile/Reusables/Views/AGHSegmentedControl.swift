//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

final class AGHSegmentedControl: UISegmentedControl {

    private var configuration = [String]()
    private var height: CGFloat = 26

    // MARK: - Init
    required init(configuration: [String]) {
        super.init(items: configuration)
        self.configuration = configuration
        self.selectedSegmentIndex = 0
        self.tintColor = .mainRed
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    }
}
