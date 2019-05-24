//
//  BuildingView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 15/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit
import MapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class BuildingView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    // Private
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var spacing = screenHeight * 0.02
    private lazy var spacingInRows = screenHeight * 0.0125
    private let leftMargin: CGFloat = 20
    private let rightMargin: CGFloat = -20
    private let cornerRadius: CGFloat = 15.0
    // Public
    public var openNavigation: (() -> Void)?
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup view methods
    
    public func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(buildingImageView)
        buildingImageView.addSubview(buildingDefaultImage)
        buildingImageView.addSubview(buildingImage)
        self.addSubview(buildingName)
        self.addSubview(departmentName)
        self.addSubview(separatorNo1)
        self.addSubview(openingHoursLabel)
        self.addSubview(openingHours)
        self.addSubview(separatorNo2)
        self.addSubview(addressLabel)
        self.addSubview(address)
        self.addSubview(separatorNo3)
        self.addSubview(mapView)
        self.addSubview(showRouteButton)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    public func setBuildingImage(named Name: String) {
        buildingImage.image = UIImage(named: Name)
    }
    
    public func setBuildingName(to Name: String) {
        buildingName.text = Name
    }
    
    public func setDepartmentName(to Name: String) {
        departmentName.text = Name
    }
    
    public func setOpeningHours(to Text: String) {
        openingHours.text = Text
    }
    
    public func setAddress(to Address: String) {
        address.text = Address
    }
    
    public func setupLocationOnAddress() {
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Image View
    private lazy var buildingImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightPeach
        view.layer.cornerRadius = cornerRadius
        return view
    }()
    
    // Default Image
    private lazy var buildingDefaultImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "building_Location")
        return image
    }()
    
    // Photo of Building
    private lazy var buildingImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.layer.cornerRadius = cornerRadius
        return image
    }()

    // Building Name
    private lazy var buildingName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Budynek"
        return label
    }()
    
    // Department Name
    private lazy var departmentName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Infinity lines
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Wydział"
        return label
    }()
    
    // Separator No. 1
    private lazy var separatorNo1: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // Opening Hours Label
    private lazy var openingHoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Godziny otwarcia"
        return label
    }()
    
    // Opening Hours
    private lazy var openingHours: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .customGrayText
        label.textAlignment = .right
        label.text = "Codziennie \n24h/7"
        return label
    }()
    
    // Separator No. 2
    private lazy var separatorNo2: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // Address Label
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Adres"
        return label
    }()
    
    // Address
    private lazy var address: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .mainRed
        label.textAlignment = .right
        label.text = "Czarnowiejska"
        return label
    }()
    
    // Separator No. 3
    private lazy var separatorNo3: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // Map
    private lazy var mapView: MKMapView = {
        let map = MKMapView(frame: .zero)
        map.layer.cornerRadius = cornerRadius
        centerMapOnAGH(for: map)
        return map
    }()
    
    // Show Route Button
    private lazy var showRouteButton: UIButton = {
        let button = AGHButton(title: "pokaż trasę",
                               style: .withLeftAccessory,
                               leftAccesoryName: "star").build()
        button.addTarget(self, action: #selector(onPressOpenNavigation), for: .touchUpInside)
        return button
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    private func setupConstraints() {
        
        // Image View
        buildingImageView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(spacing)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(screenHeight * 0.2)
            make.left.equalToSuperview().offset(leftMargin)
            make.right.equalToSuperview().offset(rightMargin)
        }
        
        // Default Image
        buildingDefaultImage.snp.makeConstraints { (make) in
            make.center.equalTo(buildingImageView)
        }
        
        // Photo of Building
        buildingImage.snp.makeConstraints { (make) in
            make.size.equalTo(buildingImageView)
        }
        
        // Building Name
        buildingName.snp.makeConstraints { (make) in
            make.top.equalTo(buildingImageView.snp.bottom).offset(spacing)
            make.left.equalToSuperview().offset(leftMargin)
        }
        
        // Department Name
        departmentName.snp.makeConstraints { (make) in
            make.top.equalTo(buildingName.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(leftMargin)
            make.right.equalToSuperview().offset(rightMargin)
        }
        
        // Separator No. 1
        separatorNo1.snp.makeConstraints { (make) in
            make.top.equalTo(departmentName.snp.bottom).offset(spacing)
            make.width.equalToSuperview()
        }
        
        // Opening Hours Label
        openingHoursLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(openingHours)
            make.left.equalToSuperview().offset(leftMargin)
        }
        
        // Opening Hours
        openingHours.snp.makeConstraints { (make) in
            make.top.equalTo(separatorNo1.snp.bottom).offset(spacingInRows)
            make.right.equalToSuperview().offset(rightMargin)
        }
        
        // Separator No. 2
        separatorNo2.snp.makeConstraints { (make) in
            make.top.equalTo(openingHours.snp.bottom).offset(spacingInRows)
            make.width.equalToSuperview()
        }
        
        // Address Label
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separatorNo2.snp.bottom).offset(spacingInRows)
            make.left.equalToSuperview().offset(leftMargin)
        }
        
        // Address
        address.snp.makeConstraints { (make) in
            make.top.equalTo(separatorNo2.snp.bottom).offset(spacingInRows)
            make.right.equalToSuperview().offset(rightMargin)
        }
        
        // Separator No. 3
        separatorNo3.snp.makeConstraints { (make) in
            make.top.equalTo(address.snp.bottom).offset(spacingInRows)
            make.width.equalToSuperview()
        }
        
        // Map
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(separatorNo3.snp.bottom).offset(spacing)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(leftMargin)
            make.right.equalToSuperview().offset(rightMargin)
            make.bottom.equalTo(showRouteButton.snp.top).offset(-spacing)
        }
        
        // Show Route Button
        showRouteButton.snp.makeConstraints { (make) in
            make.width.equalTo(160)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-spacing)
        }
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Selectors
    
    @objc private func onPressOpenNavigation() {
        openNavigation?()
    }
    
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extension of center map on AGH

private extension BuildingView {
    
    private func centerMapOnAGH(for map: MKMapView) {
        let initialLocation = CLLocation(latitude: 50.064552, longitude: 19.923064)
        let regionRadius: CLLocationDistance = 200
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
}
