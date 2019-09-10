//
//  InformationsViewController.swift
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

class InformationsViewController: UIViewController {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    // View
    private var infromationsView: InformationsView { return self.view as! InformationsView }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = InformationsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infromationsView.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
