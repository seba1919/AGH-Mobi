//
//  File.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 16/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class AboutAsViewController : UIViewController {
    
    public override func loadView() {
        super.loadView()
        
        self.view = AboutAsView(frame: UIScreen.main.bounds)
    }
    
}
