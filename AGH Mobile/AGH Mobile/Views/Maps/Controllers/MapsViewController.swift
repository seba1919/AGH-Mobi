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
    private let locationManager = CLLocationManager()
    private var selectedCellIndexPath: IndexPath?
    private let mapDataCategoriesNames = ["MapCategoryBuildings",
                                          "MapCategoryFood",
                                          "MapCategoryPhotocopying",
                                          "MapCategoryLibraries",
                                          "MapCategoryShops"]
    private var mapDataFeatures: [MapDataFeature] = [] {
        didSet {
            reloadTableView()
            reloadAnnotations()
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
        setupLocationManager()
        fetchAllMapData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
    private func setupListContentViewController() {
        listContentViewController = ListContentViewController()
        listContentViewController.listContentView.tableView.delegate = self
        listContentViewController.listContentView.tableView.dataSource = self
        if listContentViewController.listContentView.tableView.tableHeaderView is CategoriesTableViewHeader {
            let tableHeaderView = listContentViewController.listContentView.tableView.tableHeaderView
            let header = tableHeaderView as! CategoriesTableViewHeader
            header.collectionView.delegate = self
            header.collectionView.dataSource = self
        }
        listContentViewController.listContentView.searchBarTextField.delegate = self
    }
    
    private func setupListFloatingPanelController() {
        listFloatingPanelController = FloatingPanelController()
        listFloatingPanelController.delegate = self
        listFloatingPanelController.set(contentViewController: listContentViewController)
        listFloatingPanelController.track(scrollView: listContentViewController.listContentView.tableView)
        listFloatingPanelController.surfaceView.cornerRadius = 9.0
        listFloatingPanelController.surfaceView.shadowHidden = false
        listFloatingPanelController.addPanel(toParent: self)
    }
    
    private func setupLocationManager() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: - Networking and data
    private func fetchMapData(forResource resourceName: String) -> [MapDataFeature]? {
        guard let urlMapCategoryBuildings = Bundle.main.url(forResource: resourceName,
                                                            withExtension: "geojson") else {
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: urlMapCategoryBuildings)
            let result = try JSONDecoder().decode(MapData.self, from: jsonData)
            
            return result.features
        } catch {
            print("Error while parsing: \(error)")
            return nil
        }
    }
    
    private func fetchAllMapData() {
        for mapDataCategoryName in mapDataCategoriesNames {
            guard let mapData = fetchMapData(forResource: mapDataCategoryName) else { return }
            mapDataFeatures += mapData
        }
    }
    
    // MARK: - Map methods
    private func setupMap() {
        mapsView.mapView.delegate = self
        reloadAnnotations()
    }
    
    private func reloadAnnotations() {
        mapsView.mapView.removeAnnotations(mapsView.mapView.annotations)
        let annotations = creatAnnotations(fromData: mapDataFeatures)
        mapsView.mapView.addAnnotations(annotations)
        mapsView.mapView.showAnnotations(annotations, animated: true)
    }
    
    private func creatAnnotations(fromData features: [MapDataFeature]) -> [MKAnnotation] {
        var annotations: [MKAnnotation] = Array()
        for feature in features {
            let annotation = MapAnnotation(forFeature: feature)
            annotations.append(annotation)
        }
        return annotations
    }
    
    // MARK: - TableView methods
    private func reloadTableView() {
        listContentViewController.listContentView.tableView.reloadSections(IndexSet(integer: 0),
                                                                           with: .fade)
    }
    
    // MARK: - Actions
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Extension of FloatingPanelController Delegate
extension MapsViewController: FloatingPanelControllerDelegate {
    
    // swiftlint:disable:next identifier_name
    func floatingPanel(_ vc: FloatingPanelController,
                       layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return ListContentFloatingPanelLayout()
    }
    
    // swiftlint:disable:next identifier_name
    func floatingPanelWillBeginDragging(_ vc: FloatingPanelController) {
        dismissKeyboard()
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
        
        if let location = locationManager.location {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let userCoordinates = CLLocation(latitude: latitude,
                                             longitude: longitude)
            let destinationCoordinates = CLLocation(latitude: mapFeature.geometry.coordinates[1],
                                                    longitude: mapFeature.geometry.coordinates[0])
            let distance = userCoordinates.distance(from: destinationCoordinates) // in meters
            let distanceInKm = distance / 1000.0
            placeDetailsCell.distanceFromUser = String(format: "%.2f", distanceInKm) + " km"
        } else {
            placeDetailsCell.distanceFromUser = NSLocalizedString("Map_Autorization",
                                                                  comment: "")
        }
        return placeDetailsCell
    }
}

// MARK: - Extension of TableView Delegate
extension MapsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Floting Panel Details
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PlaceDetailsTableViewCell.cellHeight
    }
}

// MARK: - Extension of CollectionView Data Source
extension MapsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return CategoriesData.titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellIdentifier,
                                                      for: indexPath) as! CategoryCollectionViewCell
        cell.setupCategoryIconImage(CategoriesData.images[indexPath.row])
        cell.setupCategoryTitle(CategoriesData.titles[indexPath.row])
        return cell
    }
}

// MARK: - Extension of CollectionView Delegate
extension MapsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let selectedCellIndexPath = selectedCellIndexPath {
            if selectedCellIndexPath == indexPath {
                fetchAllMapData()
                collectionView.deselectItem(at: indexPath, animated: true)
                // TODO: Change seleced color 
                return false
            }
        }
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.curveEaseIn, .curveEaseOut],
                       animations: {
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
                cell.categoryRoundView.backgroundColor = .mainRed
                cell.categoryIconImageView.tintColor = .white
            }
        }, completion: { _ in
            if let mapData = self.fetchMapData(forResource: self.mapDataCategoriesNames[indexPath.row]) {
                self.mapDataFeatures = mapData
            }
        })
        selectedCellIndexPath = indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        mapDataFeatures = Array()

        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.curveEaseIn, .curveEaseOut],
                       animations: {
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
                cell.categoryRoundView.backgroundColor = .white
                cell.categoryIconImageView.tintColor = .mainRed
            }
        })
    }
}

// MARK: - Extension of MapKitMapView Delegate
extension MapsViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let selectedAnnotation = mapView.selectedAnnotations.first as? MapAnnotation {
            // TODO: Floting Panel Details
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        if let annotation = annotation as? MapAnnotation {
            let annotationView = MapAnnotationView(annotation: annotation,
                                                   reuseIdentifier: MapAnnotationView.annotationViewId)
            return annotationView
        }
        
        return nil
    }
}

// MARK: - Extension of Textfield Delegate
extension MapsViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        listFloatingPanelController.move(to: .full,
                                         animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
}
