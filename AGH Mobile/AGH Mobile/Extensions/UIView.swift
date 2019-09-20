//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

// MARK: - Imports
import UIKit
import Toast_Swift

// MARK: - UIView + shake
extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

// MARK: - UIView + Toast
extension UIView {
    
    static func showToast (message: String) {
        let windows = UIApplication.shared.windows
        windows.last?.makeToast(message)
    }
    
    static func showSpinnerToast() {
        let windows = UIApplication.shared.windows
        windows.last?.makeToastActivity(.center)
    }
    
    static func hideToastActivity() {
        let windows = UIApplication.shared.windows
        windows.last?.hideToastActivity()
    }
    
}
