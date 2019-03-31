//
//  ForYouViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class ForYouViewController: UIViewController {

//    override func loadView() {
//        let castomView = ForYouView()
//        view = castomView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
   
    
    let myView = ForYouView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMyView()
    }
    
    private func setupMyView() {
        view.addSubview(myView)
        //10 lines of constraints or so
        //myView.delegate = self
        //We now have both 'view' and 'myView'...
    }
    
}
