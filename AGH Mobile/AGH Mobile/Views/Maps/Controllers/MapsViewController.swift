//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import MapKit
import CoreLocation
import FloatingPanel

final class MapsViewController: UIViewController {

    // MARK: - Private properties
    private var mapsView: MapsView { return view as! MapsView }
    private var listFloatingPanelController: FloatingPanelController!
    private var listContentViewController: ListContentViewController!
    private var mapDataFeatures: [Feature] = [] {
        didSet {
            listContentViewController.listContentView.tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = MapsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListContentViewController()
        setupListFloatingPanelController()
        fetchMapData(forResource: "MapCategoryBuildings")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupMap()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        listFloatingPanelController.removeFromParent()
    }
}

extension MapsViewController {
    
    // MARK: - Setups
    fileprivate func setupListContentViewController() {
        listContentViewController = ListContentViewController()
        listContentViewController.listContentView.tableView.delegate = self
        listContentViewController.listContentView.tableView.dataSource = self
    }
    
    fileprivate func setupListFloatingPanelController() {
        listFloatingPanelController = FloatingPanelController()
        listFloatingPanelController.delegate = self
        listFloatingPanelController.set(contentViewController: listContentViewController)
        listFloatingPanelController.track(scrollView: listContentViewController.listContentView.tableView)
        listFloatingPanelController.surfaceView.cornerRadius = 9.0
        listFloatingPanelController.surfaceView.shadowHidden = false
        listFloatingPanelController.addPanel(toParent: self)
    }
    
    // MARK: - Networking and data
    fileprivate func fetchMapData(forResource resourceName: String) {
        guard let urlMapCategoryBuildings = Bundle.main.url(forResource: resourceName,
                                                            withExtension: "geojson") else {
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: urlMapCategoryBuildings)
            let result = try JSONDecoder().decode(MapData.self, from: jsonData)
            
            mapDataFeatures = result.features
        } catch {
            print("Error while parsing: \(error)")
            return
        }
    }
    
    // MARK: - Map methods
    fileprivate func setupMap() {
        let annotations = creatAnnotations(fromData: mapDataFeatures)
        mapsView.mapView.addAnnotations(annotations)
        mapsView.mapView.showAnnotations(annotations, animated: true)
    }
    
    private func creatAnnotations(fromData features: [Feature]) -> [MKAnnotation] {
        var annotations: [MKAnnotation] = Array()
        for feature in features {
            let coordinates = feature.geometry.coordinates
            let annotation = MKPointAnnotation()
            annotation.title = feature.properties.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: coordinates[1],
                                                           longitude: coordinates[0])
            annotations.append(annotation)
        }
        return annotations
    }
}

// MARK: - Extension of FloatingPanelController Delegate
extension MapsViewController: FloatingPanelControllerDelegate {
    
    func floatingPanel(_ vc: FloatingPanelController,
                       layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return ListContentFloatingPanelLayout()
    }
}

// MARK: - Extension of TableView DataSource
extension MapsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mapDataFeatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let placeDetailsCell = PlaceDetailsTableViewCell(style: .default,
                                                         reuseIdentifier: PlaceDetailsTableViewCell.cellIdentifier)
        let mapFeature = mapDataFeatures[indexPath.row]
        placeDetailsCell.placeTitle = mapFeature.properties.name
        
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            let userCoordinates = CLLocation(latitude: (locationManager.location?.coordinate.latitude)!,
                                             longitude: (locationManager.location?.coordinate.longitude)!)
            let destinationCoordinates = CLLocation(latitude: mapFeature.geometry.coordinates[1],
                                                    longitude: mapFeature.geometry.coordinates[0])
            let distance = userCoordinates.distance(from: destinationCoordinates) // in meters
            let distanceInKm = distance / 1000.0
            placeDetailsCell.distanceFromUser = String(format: "%.2f", distanceInKm) + " km"
        }
        return placeDetailsCell
    }
}

// MARK: - Extension of TableView Delegate
extension MapsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PlaceDetailsTableViewCell.cellHeight
    }
}
