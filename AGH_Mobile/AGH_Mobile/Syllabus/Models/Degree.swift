//
//  Degree.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit
class Degree: NSObject {

    var name:String?
    var syllabusName:String? // SyllabusSlag
    var department:String?
    
  
    public init(name:String? ,  syllabusName:String?,department:String?){
        self.name=name
        self.syllabusName=syllabusName?.replacingOccurrences(of: "\"", with: "", options: NSString.CompareOptions.literal, range: nil).components(separatedBy: "/").last;
        //last part of slag is syllabusName
       self.department=department
    }
   
    
    

}
