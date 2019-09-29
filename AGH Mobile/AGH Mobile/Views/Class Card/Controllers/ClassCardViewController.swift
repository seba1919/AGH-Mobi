//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

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
    
    // MARK: - Setup
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = NSLocalizedString("ClassCardView_ClassCard", comment: "")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(rightBarButtonItemTapped))
        rightBarButton.title = NSLocalizedString("ClassCardView_Edit", comment: "")
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setupData() {
        classCardView.setSubjectName(as: "Bazy Danych")
        classCardView.setSubjectTypeName(as: "Wykład")
        classCardView.setClassHours(on: "Poniedziałek 9.30-11.00")
        classCardView.setGroupName(as: "Grupa W")
        classCardView.setTeacherName(as: "prof.dr.hab.Jan Kowalski")
        classCardView.setBuildingName(as: "Budynek C2")
        classCardView.setClassroomNumber(as: "224")
        classCardView.setECTSNumber(as: "4ECTS")
    }
    
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

// MARK: - Extension of open map

private extension ClassCardViewController {
    
    private func openMapForPlace(for latitude: CLLocationDegrees,and longitude: CLLocationDegrees) {
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
