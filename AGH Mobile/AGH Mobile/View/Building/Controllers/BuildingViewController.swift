//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import MapKit

class BuildingViewController: UIViewController {
    
    // MARK: - Private Properties
    private var buildingView: BuildingView { return self.view as! BuildingView }
    private var address: String = ""
    private var buildingName: String = ""
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = BuildingView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildingView.setupUI()
        self.setupData()
        self.setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
}


private extension BuildingViewController {
    
    // MARK: - Setups
    private func setupNavigationAttributs() {
        self.navigationItem.title = "Budynki"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupData() {
        self.buildingName = "Budynek C1"
        buildingView.setBuildingName(to: buildingName)
        buildingView.setDepartmentName(to: "Wydział Elektrotechniki, Automatyki, Informatyki i Inżynierii Biomedycznej")
        buildingView.setOpeningHours(to: "codziennie \n7.00 - 21.00")
        self.address = "Czarnowiejska 41"
        buildingView.setAddress(to: address)
    }
    
    // MARK: - Actions
    private func setupActions() {
        buildingView.openNavigation = {
            self.openMapForPlace(for: 50.064552, and: 19.923064)
        }
    }
    
    // MARK: - Open map
    private func openMapForPlace(for latitude: CLLocationDegrees,and longitude: CLLocationDegrees) {
        let latitude = latitude
        let longitude = longitude
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = buildingName
        mapItem.openInMaps(launchOptions: options)
    }
}
