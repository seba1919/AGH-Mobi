//
//  ClassCardViewController.swift
//  AGH Mobile
//
//  Created by Macbook on 18/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit
import MapKit

class ClassCardViewController: UIViewController {
    
    // MARK: - Private properties
    private var classCardView: ClassCardView { return view as! ClassCardView }
    private var buildingName: String = ""

    // MARK: - Lifecycle
    override func loadView() {
        view = ClassCardView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.classCardView.setupUI()
        self.setupData()
        self.setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = "Karta Zajęć"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(rightBarButtonItemTapped))
        rightBarButton.title = "Edycja"
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setupData() {
        classCardView.setupSubjectName(as: "Bazy Danych")
        classCardView.setupSubjectTypeName(as: "Wykład")
        classCardView.setupClassHours(on: "Poniedziałek 9.30-11.00")
        classCardView.setupGroupName(as: "Grupa W")
        classCardView.setupTeacherName(as: "prof.dr.hab.Jan Kowalski")
        classCardView.setupBuildingName(as: "Budynek C2")
        classCardView.setupClassroomNumber(as: "224")
        classCardView.setupECTSNumber(as: "4ECTS")
    }

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    private func setupActions() {
        classCardView.openNavigation = {
            self.openMapForPlace(for: 50.064552, and: 19.923064)
        }
    }
    
    @objc private func rightBarButtonItemTapped() {
        print("Edycja")
    }
}

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Extension of open map

private extension ClassCardViewController {
    
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
