//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Private Properties
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
        settingsView.settingsContentView.pushAboutUsVC = {
            self.navigationController?.pushViewController(AboutUsViewController(), animated: true)
        }
        
        settingsView.settingsContentView.openMailApp = {
            let email = "mackn@agh.edu.pl"
            // Doesn't work in simulator
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url)
            }
        }
        
        settingsView.pushLoginPageVC = {
            self.navigationController?.pushViewController(LoginPageViewController(), animated: true)
        }
    }
}
