//
//  UniversityTeacher.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit


class UniversityTeacher: NSObject {
    var name:String?
    var surname:String?
    var email:String?
    var title:String?
    init(name:String?,surname:String?, email:String?, title:String?){
        self.name=name
        self.surname=surname
        self.email=email
        self.title=title
    }
    func getDescription()-> String{
        if let title=title{
             return title+" "+name!+" "+surname!
        }
        return " "+name!+" "+surname!
    }

}
