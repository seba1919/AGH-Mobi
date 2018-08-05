//
//  Department.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit


class Department:NSObject{
         var shortcut:String?
         var name:String?
        var image: UIImage?
        init(shortcut:String?,name:String?){
            self.shortcut=shortcut?.lowercased()
            self.name=name
        }
    init(shortcut:String?,name:String?,image:UIImage?){
        self.shortcut=shortcut?.lowercased()
        self.name=name
        self.image=image
    }
   
}


