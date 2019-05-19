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
        infromationsView.setupUI()
        setupActions()
        self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.backgroundColor : UIColor.mainRed], for: .normal)
        let backItem = UIBarButtonItem()
        backItem.title = "Wróć"
        navigationItem.backBarButtonItem = backItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
        infromationsView.informationContent.pushSylabusVC = {
            self.navigationController?.pushViewController(FacultiesViewController(), animated: true)
        }
        
    }
    
}
