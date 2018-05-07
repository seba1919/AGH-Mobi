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

class MapViewController: UIViewController, MKMapViewDelegate {

    var spotType: String = ""
    var spots: [Spot] = []
    var currentUserLocation: CLLocation!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        mapView.showsPointsOfInterest = false
        mapView.showsUserLocation = true
        if (spots.count > 0) {
            self.addSpotAnnotations()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeAnnotations()
        spotType = ""
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let ann = annotation as! CustomAnnotation
        let annotationView = MKMarkerAnnotationView(annotation: ann, reuseIdentifier: "pin")
        annotationView.markerTintColor = SpotDataSource.spotsColor[ann.type]
        annotationView.glyphImage = SpotDataSource.spotTypes[ann.type]
        
        return annotationView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentUserLocation = CLLocation(latitude: manager.location!.coordinate.latitude, longitude: manager.location!.coordinate.longitude)
        self.mapView.showsUserLocation = true
    }
    
    static func getCurrentUserLocation() -> CLLocation {
        //return currentUserLocation
        return CLLocation(latitude: 50.066190, longitude: 19.922347)
    }
 
    func addSpotAnnotations() {
        for spot in spots {
            let placemarkAnno = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: (spot.latitude), longitude: (spot.longitude)), type: spotType, title: spot.name!)
            placemarkAnno.type = spot.type!
            self.mapView.addAnnotation(placemarkAnno)
            
            let annotationOnMap = self.mapView.annotations
            self.mapView.showAnnotations(annotationOnMap, animated: true)
        }
        
        let coord = CLLocationCoordinate2D(latitude: (spots.first?.latitude)!, longitude: (spots.first?.longitude)!)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coord, span: span)
        mapView.setRegion(region, animated: true)
        mapView.centerCoordinate = coord
    }
    
    func removeAnnotations() {
        let annos = self.mapView.annotations
        self.mapView.removeAnnotations(annos)
    }
}

class CustomAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var type: String
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, type: String, title: String) {
        self.coordinate = coordinate
        self.type = type
        self.title = title
    }
}
