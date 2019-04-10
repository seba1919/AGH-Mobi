//
//  Grade.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 09/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

struct Grade {
    public var formOfClasses : String // forma zajec
    public var term1, term2, term3 : Double? // terminy
    public var issuedBy : String // wystawil
    public var type : CourseType
    public var groupShort : String // skrot grupy
    public var hoursAmount : Int
}
