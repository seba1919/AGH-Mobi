//
//  ClassCardViewController.swift
//  AGH Mobile
//
//  Created by Macbook on 18/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class ClassCardController: UIViewController {
    
    // MARK: - Private properties
    private var classCardView: ClassCardView { return view as! ClassCardView }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = ClassCardView(frame: UIScreen.main.bounds)
    }
    
}
