//
//  ForYouViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class ForYouViewController: UIViewController {

    var forYouView: ForYouView { return self.view as! ForYouView }
    
    override func loadView() {
        self.view = ForYouView(frame: UIScreen.main.bounds)
    }
    
}
