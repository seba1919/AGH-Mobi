//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import MapKit

class BuildingViewController: UIViewController {
    
    // MARK: - Public Properties
    var dataFeature: MapDataFeature? {
        didSet {
            updataData()
        }
    }
    
    // MARK: - Private Properties
    private var buildingView: BuildingView { return self.view as! BuildingView }
    private var buildingName = ""
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = BuildingView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildingView.setupUI()
        self.setupTemporaryData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
}

extension BuildingViewController {
    
    // MARK: - Setups
    private func setupNavigationAttributs() {
        self.navigationItem.title = "Budynki"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupTemporaryData() {
        buildingView.setDepartmentName("Wydział Elektrotechniki, Automatyki, Informatyki i Inżynierii Biomedycznej")
        buildingView.setOpeningHours("codziennie \n7.00 - 21.00")
        buildingView.setAddress("Czarnowiejska 41")
    }
    
    // MARK: - Open map
    private func openMapForPlace(for latitude: CLLocationDegrees,
                                 and longitude: CLLocationDegrees) {
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates,
                                            latitudinalMeters: regionDistance,
                                            longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates,
                                    addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = buildingName
        mapItem.openInMaps(launchOptions: options)
    }
    
    // MARK: - Updata data
    private func updataData() {
        if let data = dataFeature {
            self.buildingName = data.properties.name
            self.buildingView.setBuildingName(buildingName)
            self.buildingView.openNavigation = {
                self.openMapForPlace(for: data.geometry.coordinates[1],
                                     and: data.geometry.coordinates[0])
            }
            self.buildingView.centerMap(on: data.geometry.coordinates[1],
                                        and: data.geometry.coordinates[0])
        }
    }
}
