//
//  MapsViewController.swift
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

class MapsViewController: UIViewController {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Coordinators
    weak var coordinator:  MapsCoordinator?
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    var mapsView: MapsView { return self.view as! MapsView }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = MapsView(frame: UIScreen.main.bounds)
    }
    
}
