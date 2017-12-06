//
//  SKOSEmployee.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 10.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class SKOSEmployee:NSObject {
    var employeeName:String?
    var link:String?
    var departmient:String?
    var degree:String?
    var basicData:[[String:String?]]=[]
    var additionalData:[[String:String?]]=[]
    var jobTitle:[[String:String?]]=[]

    init(_employeeName:String?,_departmient:String?,_link:String?, _degree:String?){
        employeeName=_employeeName
        link=_link
        departmient=_departmient
        degree=_degree
    }
    init(_employeeName:String?,_departmient:String?,_link:String?){
        employeeName=_employeeName
        link=_link
        departmient=_departmient
        degree=""
    }
    init(_link:String?){
        employeeName=""
        link=_link
        departmient=""
        degree=""
    }
   
}
