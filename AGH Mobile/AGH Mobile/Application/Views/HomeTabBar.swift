//
//  HomeTabBar.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 31/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class HomeTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
