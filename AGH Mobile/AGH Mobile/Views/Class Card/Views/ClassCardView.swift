//
//  ClassCardView.swift
//  AGH Mobile
//
//  Created by Macbook on 18/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// MARK: - Import

import UIKit
import MapKit

// MARK: - Implementation

class ClassCardView: UIView {
    
    // MARK: - Private properties
    
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var spacing = screenHeight * 0.03
    private lazy var spacingInRows = screenHeight * 0.0125
    private let leftMargin: CGFloat = 20
    private let rightMargin: CGFloat = -20
    private let cornerRadius: CGFloat = 15.0


    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup view methods
    
    public func setupUI() {
        setupProperties()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        [subjectName,
         separator,
         subjectType,
         rowStackView,
         mapView,
         showRouteButton].forEach({addSubview($0)})
        
        [classHourRowView,
         teacherRowView,
         buildingRowView,
         ectsNumberRowView].forEach({rowStackView.addArrangedSubview($0)})
    }
    
    // MARK: - Components of View

    private lazy var subjectName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Bazy Danych"
        return lbl
    }()
    
    private lazy var separator: UIView = {
        let v = SeparatorView().build()
        return v
    }()
    
    private lazy var subjectType: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.textColor = .mainRed
        lbl.textAlignment = .left
        lbl.text = "Wykład"
        return lbl
    }()
    

    private lazy var classHourRowView: RowView = {
        let view = RowView(style: .withDescription, separatorPosition: .none, touchDetect: .off, accessory: .withoutRightAccessory)
        view.setupTitle(as: "Poniedziałek 9.30-11.00")
        view.setupDescription(as: "Grupa W")
        view.setupLeftAccessory(named: "clock_Classes")
        view.setupTextColor(as: .customDarkGrayText)
        return view
    }()
    
    private lazy var teacherRowView: RowView = {
        let view = RowView(style: .withLeftAccessory, separatorPosition: .none)
        view.setupTitle(as: "prof.dr.hab.Jan Kowalski")
        view.setupLeftAccessory(named: "human_Classes")
        view.setupTextColor(as: .customDarkGrayText)
        return view
    }()
    
    private lazy var buildingRowView: RowView = {
        let view = RowView(style: .withDescription, separatorPosition: .none)
        view.setupTitle(as: "Budynek C2")
        view.setupDescription(as: "224")
        view.setupLeftAccessory(named: "location_Classes")
        view.setupTextColor(as: .customDarkGrayText)
        return view
    }()

    private lazy var ectsNumberRowView: RowView = {
        let view = RowView(style: .withDescription, separatorPosition: .none)
        view.setupTitle(as: "4ECTS")
        view.setupDescription(as: "Syllabus")
        view.setupLeftAccessory(named: "book_Classes")
        view.setupTextColor(as: .customDarkGrayText)
        
        return view
    }()
    
    private lazy var rowStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0.0
        return stack
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
        let button = AGHButton(title: "pokaż trasę").build()
                         //      style: .withLeftAccessory, leftAccesoryName: "star").build()
        return button
    }()

    // MARK: - Constraints
    
    private func setupConstraints() {
        
        subjectName.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(spacing)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        separator.snp.makeConstraints { (make) in
            make.top.equalTo(subjectName.snp.bottom).offset(spacing)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        subjectType.snp.makeConstraints { (make) in
            make.top.equalTo(separator.snp.bottom).offset(spacingInRows)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        rowStackView.snp.makeConstraints { (make) in
            make.top.equalTo(subjectType.snp.bottom).offset(spacingInRows)
            make.left.right.equalToSuperview()
        }
        
        // Map
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(rowStackView.snp.bottom).offset(spacing)
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
    
    private func setupProperties() {
        
        if UIScreen.isSmallSize() {
            
            spacing = screenHeight * 0.02
            spacingInRows = screenHeight * 0.01
            subjectName.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            subjectType.font = UIFont.systemFont(ofSize: 11, weight: .bold)
            
        }
        else if UIScreen.isMediumSize(){
            
            spacing = screenHeight * 0.025
            spacingInRows = screenHeight * 0.01
            subjectName.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            subjectType.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        }
    }
    
    
}
    extension ClassCardView {
        
        func centerMapOnAGH(for map: MKMapView) {
            let initialLocation = CLLocation(latitude: 50.064552, longitude: 19.923064)
            let regionRadius: CLLocationDistance = 200
            let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            map.setRegion(coordinateRegion, animated: true)
        }
        
}
