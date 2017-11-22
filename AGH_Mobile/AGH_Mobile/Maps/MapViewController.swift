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
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        determineMyCurrentLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeAnnotations()
        spotType = ""
    }
    
    func determineMyCurrentLocation() {

        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locValue: CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        mapView.showsUserLocation = true
    }
 
    func addSpotAnnotations() {
        for i in 0...spots.count-1 {
            let anno = MKPointAnnotation()
            anno.coordinate = (spots[i].coordinates)!
            anno.title = spots[i].name
            mapView.addAnnotation(anno)
        }
        let coord = mapView.annotations.first?.coordinate
//        mapView.setCenter(coord!, animated: false)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coord!, span: span)
        mapView.setRegion(region, animated: true)
        
        mapView.centerCoordinate = coord!
    }
    
    func removeAnnotations() {
        let annos = mapView.annotations
        mapView.removeAnnotations(annos)
    }
    
}
