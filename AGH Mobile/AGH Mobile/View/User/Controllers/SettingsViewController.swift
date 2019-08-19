//
//  SettingsViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class SettingsViewController: UIViewController {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Coordinators
    weak var coordinator:  SettingsCoordinator?
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    // View
    private var settingsView: SettingsView { return self.view as! SettingsView }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
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
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    private func setupActions() {
        
        settingsView.settingsContent.pushAboutAsVC = {
            self.navigationController?.pushViewController(AboutAsViewController(), animated: true)
        }
        
        settingsView.settingsContent.openMailApp = {
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
