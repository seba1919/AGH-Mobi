//
//  InformationsViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class InformationsViewController: UIViewController {

    var infromationsView: InformationsView { return self.view as! InformationsView }
    
    override func loadView() {
        self.view = InformationsView(frame: UIScreen.main.bounds)
    }
}
