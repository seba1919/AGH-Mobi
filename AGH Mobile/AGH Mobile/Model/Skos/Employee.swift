//
//  SkosData.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 15/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

struct Employee {
    var employeeName:String
    var link:String?
    var department:String?
    var degree:String?
    var basicData:[[String:String?]]=[]
    var additionalData:[[String:String?]]=[]
    var jobTitle:[[String:String?]]=[]
}
