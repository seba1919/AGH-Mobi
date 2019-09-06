//
//  UIView.swift
//  AGH Mobile
//
//  Created by Mateusz Wagner on 06/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit
import Toast_Swift

extension UIView  {
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    class func showToast (message: String) {
        let windows = UIApplication.shared.windows
        windows.last?.makeToast(message)
    }
    
}
