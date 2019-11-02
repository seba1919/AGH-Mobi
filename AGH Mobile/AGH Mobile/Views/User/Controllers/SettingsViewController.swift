//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {

    weak var coordinator: SettingsCoordinator?

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
}

extension SettingsViewController {
    
    // MARK: - Setup
    private func setupNavigationAttributs() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Actions
    private func setupActions() {
    settingsView.settingsContent.pushAboutAsVC = {
            self.coordinator?.showTeamMembers()
        }
        
        settingsView.settingsContentView.openMailApp = {
            let email = "mackn@agh.edu.pl"
            // Doesn't work in simulator
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url)
            }
        }
        
        settingsView.pushLoginPageVC = {
            WDRouterNetworking().performLogoutAction {
                CustomNotifications.setupAlertOnLogoutSuccess()
                self.coordinator?.signOut()
            }
        }
    }
}
