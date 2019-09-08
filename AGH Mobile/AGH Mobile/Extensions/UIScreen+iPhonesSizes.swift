//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

extension UIScreen {
    
    /// Iphones SE, 5s and other small things
    public static func isSmallSize() -> Bool {
        if UIScreen.main.bounds.size.height < 569 {
            return true
        }
        return false
    }
    
    /// Iphones 6, 6s, 7, 8
    public static func isMediumSize() -> Bool {
        if UIScreen.main.bounds.size.height > 569 &&
           UIScreen.main.bounds.size.height < 668 {
            return true
        }
        return false
    }
    
    /// Iphones 6+, 6s+, 7+, 8+
    public static func isLargeSize() -> Bool {
        if UIScreen.main.bounds.size.height > 668 &&
           UIScreen.main.bounds.size.height < 737 {
            return true
        }
        return false
    }
    
    /// Bigger Iphones: X, XS, XS Max, XR ...
    public static func isBigSize() -> Bool {
        if UIScreen.main.bounds.size.height > 737 {
            return true
        }
        return false
    }
    
}
