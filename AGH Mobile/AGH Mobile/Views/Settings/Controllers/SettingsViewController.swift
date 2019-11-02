//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Instance properties
    weak var coordinator: SettingsCoordinator?
    // View
    private var settingsView: SettingsView { return self.view as! SettingsView }

    // MARK: - Lifecycle
    override func loadView() {
        self.view = SettingsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingsView.setupUI()
        self.setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    
    // MARK: - Setup navigation controller
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Actions
    private func setupActions() {
        
        settingsView.settingsContent.pushAboutAsVC = {
            self.coordinator?.showAboutUs()
        }
        
        settingsView.settingsContent.openMailApp = {
            let email = "mackn@agh.edu.pl"
            // Doesn't work in simulator - test in phisical device
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url)
            }
        }
        
        settingsView.pushLoginPageVC = {
            WDRouterNetworking().performLogoutAction {
                self.coordinator?.signOut()
                CustomNotifications.setupAlertOnLogoutSuccess()
            }
        }
    }
}
