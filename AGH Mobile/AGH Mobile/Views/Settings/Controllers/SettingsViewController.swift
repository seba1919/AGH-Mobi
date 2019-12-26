//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Instance properties
    // View
    private var settingsView: SettingsView { return self.view as! SettingsView }

    // MARK: - Initialisation
    init() {
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
            let viewController = AboutUsViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        settingsView.settingsContent.openMailApp = {
            let email = "mackn@agh.edu.pl"
            // Doesn't work in simulator
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url)
            }
        }
        
        settingsView.pushLoginPageVC = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
