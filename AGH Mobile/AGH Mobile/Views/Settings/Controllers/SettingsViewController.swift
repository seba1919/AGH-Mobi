//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Instance properties
    let viewModel: SettingsViewModel
    
    // View
    private var settingsView: SettingsView { return self.view as! SettingsView }

    // MARK: - Initialisation
    init(with settingsViewModel: SettingsViewModel) {
        self.viewModel = settingsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = SettingsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelHandlers()
        self.settingsView.setupUI()
        self.setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    
    fileprivate func setupViewModelHandlers() {
        let signOutHandler = { CustomNotifications.setupAlertOnLogoutSuccess() }
        viewModel.setupActionHandlers(forSignOut: signOutHandler)
    }
    
    // MARK: - Setup navigation controller
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Actions
    private func setupActions() {
        
        settingsView.settingsContent.pushAboutAsVC = {
            self.viewModel.showAboutUs()
        }
        
        settingsView.settingsContent.openMailApp = {
            self.viewModel.sendMail()
        }
        
        settingsView.pushLoginPageVC = {
            self.viewModel.signOut()
        }
    }
}
