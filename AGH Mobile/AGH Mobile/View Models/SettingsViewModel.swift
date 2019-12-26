//
//  PersonViewModel.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 22/12/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class SettingsViewModel {
    // MARK: Dependencies
    private let coordinator: SettingsCoordinator
    
    // Action handler
    private var handleSignOut: (() -> Void)!
    
    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
    }
    
    public func setupActionHandlers(forSignOut signOutHandler: @escaping (() -> Void)) {
        self.handleSignOut = signOutHandler
    }
    
    public func showAboutUs() {
        coordinator.showAboutUs()
    }
    
    public func signOut() {
        WDRouterNetworking().performLogoutAction {
            self.coordinator.signOut()
            self.handleSignOut()
        }
    }
    
    public func sendMail() {
        let email = "mackn@agh.edu.pl"
        // Doesn't work in simulator - test in phisical device
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
}
