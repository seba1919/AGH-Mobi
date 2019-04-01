//
//  UserViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    var userView: UserView { return self.view as! UserView }
    
    override func loadView() {
        self.view = UserView(frame: UIScreen.main.bounds)
    }
    
}
