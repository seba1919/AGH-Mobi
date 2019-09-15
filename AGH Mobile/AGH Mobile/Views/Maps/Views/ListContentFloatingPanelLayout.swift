//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import FloatingPanel

class ListContentFloatingPanelLayout: FloatingPanelLayout {
    
    var initialPosition: FloatingPanelPosition {
        return .tip
    }
    
    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
        case .full: return 16.0
        case .half: return 260.0
        case .tip: return 77.0
        default: return nil
        }
    }
}
