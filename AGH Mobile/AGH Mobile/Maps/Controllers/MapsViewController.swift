//
//  MapsViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class MapsViewController: UIViewController {

    var mapsView: MapsView { return self.view as! MapsView }
    
    override func loadView() {
        self.view = MapsView(frame: UIScreen.main.bounds)
    }
    
}
