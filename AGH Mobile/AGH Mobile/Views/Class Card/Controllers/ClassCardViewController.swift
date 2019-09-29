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
        self.setupClassCardViewData()
        self.setupClassCardViewActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributes()
    }
    
    // MARK: - Setup
    
    private func setupNavigationAttributes() {
        self.navigationItem.title = NSLocalizedString("ClassCardView_ClassCard", comment: "")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(rightBarButtonItemTapped))
        rightBarButton.title = NSLocalizedString("ClassCardView_Edit", comment: "")
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setupClassCardViewData() {
        classCardView.setSubjectNameLabelWith(text: "Bazy Danych")
        classCardView.setSubjectTypeNameLabelWith(text: "Wykład")
        classCardView.setClassHoursLabelWith(text: "Poniedziałek 9.30-11.00")
        classCardView.setGroupNameLabelWith(text: "Grupa W")
        classCardView.setTeacherNameLabelWith(text: "prof.dr.hab.Jan Kowalski")
        classCardView.setBuildingNameLabelWith(text: "Budynek C2")
        classCardView.setClassroomNumberLabelWith(text: "224")
        classCardView.setECTSNumberLabelWith(text: "4ECTS")
    }
    
    // MARK: - Actions
    
    private func setupClassCardViewActions() {
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
