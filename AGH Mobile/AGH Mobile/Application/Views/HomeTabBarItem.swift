//
//  HomeTabBarItem.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 31/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class HomeTabBarItem: UITabBarItem {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor : UIColor(red: 0.55, green: 0.11, blue: 0.55, alpha: 1)],
                               for: .selected)
    }
    
}
