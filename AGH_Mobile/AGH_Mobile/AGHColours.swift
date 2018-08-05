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
    static let aghBlack=UIColor(hex:"#1E1E1E")
    static let aghRed=UIColor(hex:"#B5032C")
    static let aghGreen=UIColor(hex:"#00693C")
    public static func getTabBarColour()->UIColor{
       // return red
        return red4
    }
    public static func getNavigationBarColour()->UIColor{
        return red4
    }
    public static func getArrayOfAGHColours(count:Int)->[UIColor]{
        var colours:[UIColor]=[]
        if count > 0 {
            for i in 0..<count{
                if i%3==0{
                    colours.append(aghGreen)
                }
                if i%3==1{
                    colours.append(aghBlack)
                }
                if i%3==2{
                    colours.append(aghRed)
                }
                
            }
            
        }
        return colours
    }
}
