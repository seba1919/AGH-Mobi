//
//  ModuleActivity.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit

class ModuleActivity: NSObject {
    var type:String?
    var hours:Int?
    var classesTopic:String?
    var classesDescription:String?
    
    init(type:String?, hours:Int?,classesTopic:String?, classesDescription:String?) {
        self.type=type
        self.hours=hours
        self.classesTopic=classesTopic
        self.classesDescription=classesDescription
    }



}
