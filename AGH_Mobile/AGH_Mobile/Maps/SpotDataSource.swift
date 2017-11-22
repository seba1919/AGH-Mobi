//
//  SpotDataSource.swift
//  AGH_Mobile
//
//  Created by patrycja on 16.11.2017.
//  Copyright © 2017 mackn. All rights reserved.
//

import UIKit
import MapKit

class SpotDataSource: NSObject {
    
    static var spots: [Spot] = [
        Spot(type: "Wydziały", name: "C1", coordinates: CLLocationCoordinate2D(latitude: 50.065390, longitude: 19.922709)),
        Spot(type: "Wydziały", name: "C2", coordinates: CLLocationCoordinate2D(latitude: 50.065879, longitude: 19.922677)),
        Spot(type: "Wydziały", name: "A0", coordinates: CLLocationCoordinate2D(latitude: 50.064506, longitude: 19.923320)),
        Spot(type: "Stołówki", name: "Tawo", coordinates: CLLocationCoordinate2D(latitude: 50.065507, longitude: 19.918454)),
        Spot(type: "Stołówki", name: "Obieżyświat", coordinates: CLLocationCoordinate2D(latitude: 50.066806, longitude: 19.920131))
    ]
    
    override init() {
        
    }
    
    static func getSpotList(spotType: String) -> [Spot] {
        switch spotType {
        case "Wydziały":
            return spots.filter { $0.type == "Wydziały" }
        case "Stołówki":
            return spots.filter { $0.type == "Stołówki" }
        default:
            return []
        }
    }
    
    static func getParticularSpot(spotName: String) -> [Spot] {
        return spots.filter { $0.name == spotName }
    }
}
