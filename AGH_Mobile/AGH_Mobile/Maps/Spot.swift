//
//  Spot.swift
//  AGH_Mobile
//
//  Created by patrycja on 16.11.2017.
//  Copyright © 2017 mackn. All rights reserved.
//

import UIKit
import MapKit

class Spot: NSObject {
    var type: String?
    var name: String?
    var coordinates: CLLocationCoordinate2D?
    
    init(type: String?, name: String?, coordinates: CLLocationCoordinate2D?) {
        self.type = type
        self.name = name
        self.coordinates = coordinates
    }
}
