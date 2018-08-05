//
//  AGHColours.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 03.08.2018.
//  Copyright © 2018 mackn. All rights reserved.
//

import UIKit

class AGHColours: NSObject {
    static let red=UIColor(hex:"#B5032C")
    static let red2=UIColor(hex:"#E8100C")
    static let red3=UIColor(hex:"#400000")
    static let red4=UIColor(hex:"7F0000")
    static let green=UIColor(hex:"#00693C")
    
    public static func getTabBarColour()->UIColor{
       // return red
        return red4
    }
    public static func getNavigationBarColour()->UIColor{
        return red4
    }
}
