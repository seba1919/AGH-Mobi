//
//  HomeTabBarController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewControllers = [ForYouViewController(), StudiesViewController(), MapsViewController(), InformationsViewController(), UserViewController()]
        
    }
    
}
