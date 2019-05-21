//
//  BuildingViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 15/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class BuildingViewController: UIViewController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    private var buildingView: BuildingView { return self.view as! BuildingView }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = BuildingView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildingView.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = "Budynki"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    private func setupActions() {
        
    }
    
}
