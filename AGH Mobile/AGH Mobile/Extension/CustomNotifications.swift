//
//  CustomNotifications.swift
//  AGH Mobile
//
//  Created by mac on 07/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class CustomNotifications {
    
    
    public static func addCustomAlert(with message: String) {
        UIView.showToast(message: message)
    }
    
    public static func addCustomSpinnerAlert() {
        UIView.showSpinnerToast()
    }
    
    public static func hideCustomSpinnerAlert() {
        UIView.hideToastActivity()
    }
}
