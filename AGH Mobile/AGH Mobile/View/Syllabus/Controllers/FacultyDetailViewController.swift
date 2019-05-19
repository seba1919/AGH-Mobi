//
//  FacultyDetailViewController.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 19/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class FacultyDetailViewController: UIViewController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance properties
    
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView() {
        
    }
    
    private func setUpNavController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Syllabus"
        
        // Right bar button
        let rightBarButton = UIBarButtonItem()
        rightBarButton.target = self
        rightBarButton.action = #selector(rightBarButtonItemTapped)
        rightBarButton.title = "2018/19"
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    @objc private func rightBarButtonItemTapped() {
        #warning("Implement picker view")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Helpers
    
    private func toggleTitle() {
        title = self.title == "Syllabus" ? "Wydziały" : "Syllabus"
    }
    
}
