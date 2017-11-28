//
//  MapViewController.swift
//  AGH_Mobile
//
//  Created by patrycja on 16.11.2017.
//  Copyright © 2017 mackn. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    var spotType: String = ""
    var spots: [Spot] = []
    var currentUserLocation: CLLocation!
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsPointsOfInterest = false
        
        if (spots.count > 0) {
            addSpotAnnotations()
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeAnnotations()
        spotType = ""
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentUserLocation = CLLocation(latitude: manager.location!.coordinate.latitude, longitude: manager.location!.coordinate.longitude)
        mapView.showsUserLocation = true
    }
    
    static func getCurrentUserLocation() -> CLLocation {
        //return currentUserLocation
        return CLLocation(latitude: 50.066190, longitude: 19.922347)
    }
 
    func addSpotAnnotations() {
        for i in 0...spots.count-1 {
            let anno = MKPointAnnotation()
            anno.coordinate = CLLocationCoordinate2D(latitude: spots[i].latitude, longitude: spots[i].longitude)
            anno.title = spots[i].name
            mapView.addAnnotation(anno)
        }
        let coord = CLLocationCoordinate2D(latitude: (spots.first?.latitude)!, longitude: (spots.first?.longitude)!)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coord, span: span)
        mapView.setRegion(region, animated: true)
        mapView.centerCoordinate = coord
    }
    
    func removeAnnotations() {
        let annos = mapView.annotations
        mapView.removeAnnotations(annos)
    }
    
}
