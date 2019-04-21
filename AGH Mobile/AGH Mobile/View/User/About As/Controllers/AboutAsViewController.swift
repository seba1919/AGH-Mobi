//
//  File.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 16/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class AboutAsViewController : UIViewController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    var aboutAsView: AboutAsView { return self.view as! AboutAsView }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()

        self.view = AboutAsView(frame: UIScreen.main.bounds)
        aboutAsView.setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
