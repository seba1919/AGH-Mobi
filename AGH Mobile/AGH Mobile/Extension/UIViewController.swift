//
//  UIViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Wagner on 06/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit
import SwiftToast

extension UIViewController {
    
    func showToast(message: String) {
        let toast =  SwiftToast(
            text: message,
            textAlignment: .center,
            backgroundColor: #colorLiteral(red: 0.5290778279, green: 0.2989262938, blue: 0.295771122, alpha: 1),
            textColor: .white,
            font: .boldSystemFont(ofSize: 15.0),
            duration: 1.0,
            minimumHeight: CGFloat(100.0),
            statusBarStyle: .lightContent,
            aboveStatusBar: true,
            target: nil,
            style: .navigationBar)
        present(toast, animated: true)
    }
    
}
