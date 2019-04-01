//
//  StudiesViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class StudiesViewController: UIViewController {

    var studiesView: StudiesView { return self.view as! StudiesView }
    
    override func loadView() {
        self.view = StudiesView(frame: UIScreen.main.bounds)
    }
    
}
