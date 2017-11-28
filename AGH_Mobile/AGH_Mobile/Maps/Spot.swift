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
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    
    init(type: String?, name: String?, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.type = type
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var location: CLLocation {
        return CLLocation(latitude: self.latitude, longitude: self.longitude)
    }
    
    func distance(to location: CLLocation) -> CLLocationDistance {
        return location.distance(from: self.location)
    }
}
