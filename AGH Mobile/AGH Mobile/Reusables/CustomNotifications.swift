//
//  CustomNotifications.swift
//  AGH Mobile
//
//  Created by Mateusz Wagner on 07/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// MARK: - Import
import UIKit

class CustomNotifications {
    
    // MARK: - Custom Alert Notifications Fot LoginPageViewController
    public static func setupAlertOnLoginFailiture() {
        UIView.showToast(message: NSLocalizedString("CustomNotifications_InvalidLoginData", comment: ""))
    }
    
    public static func setupAlertOnLoginSuccess() {
        UIView.showToast(message: NSLocalizedString("CustomNotifications_LoginSuccess", comment: ""))
    }
    
    public static func setupAlertOnMissingLoginCredentials() {
        UIView.showToast(message: NSLocalizedString("CustomNotifications_MissingLoginCredentials", comment: ""))
    }
    
    // MARK: - Custom Alert Notifications Fot WDRouterNetworking
    public static func setupAlertOnServerConnectionFailture() {
        UIView.showToast(message: NSLocalizedString("CustomNotifications_ServerError", comment: ""))
    }
    
    // MARK: - Custom Alert Notifications Fot SettingsViewController
    public static func setupAlertOnLogoutSuccess() {
        UIView.showToast(message: NSLocalizedString("CustomNotifications_LogoutSuccess", comment: ""))
    }
    
    public static func setupAlertOnLogoutFailture() {
        UIView.showToast(message: NSLocalizedString("CustomNotifications_LogoutError", comment: ""))
    }
    
    // MARK: - Custom Spinner Alert Notifications Fot Application
    public static func showCustomSpinnerAlert() {
        UIView.showSpinnerToast()
    }
    
    public static func hideCustomSpinnerAlert() {
        UIView.hideToastActivity()
    }
}
