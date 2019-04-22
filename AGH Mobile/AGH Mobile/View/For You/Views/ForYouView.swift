//
//  ForYouView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 31/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class ForYouView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup background color to distinguish in TabBar
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}