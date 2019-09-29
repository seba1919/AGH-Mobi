//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import MapKit

class ClassCardView: UIView {
    
    // MARK: - Public properties
    public var openNavigation: (() -> Void)?
    
    // MARK: - Private properties
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var spacing = screenHeight * 0.03
    private lazy var spacingInRows = screenHeight * 0.0125
    private let leftMargin: CGFloat = 20
    private let rightMargin: CGFloat = -20
    private let cornerRadius: CGFloat = 15.0
    
    // MARK: - Components of View
    
    private lazy var subjectNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var separator: UIView = {
        let separatorView = SeparatorView().build()
        return separatorView
    }()
    
    private lazy var subjectTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .mainRed
        label.textAlignment = .left
        return label
    }()
    
    private lazy var classHoursRowView: RowView = {
        let rowView = RowView(style: .withDescription, separatorPosition: .none, touchDetect: .off, accessory: .withoutRightAccessory)
        rowView.setupLeftAccessory(named: "clock_Classes")
        rowView.setupTextColor(as: .customDarkGrayText)
        return rowView
    }()
    
    private lazy var teacherRowView: RowView = {
        let rowView = RowView(style: .withLeftAccessory, separatorPosition: .none)
        rowView.setupLeftAccessory(named: "human_Classes")
        rowView.setupTextColor(as: .customDarkGrayText)
        return rowView
    }()
    
    private lazy var buildingRowView: RowView = {
        let rowView = RowView(style: .withDescription, separatorPosition: .none)
        rowView.setupLeftAccessory(named: "location_Classes")
        rowView.setupTextColor(as: .customDarkGrayText)
        return rowView
    }()
    
    private lazy var ectsNumberRowView: RowView = {
        let rowView = RowView(style: .withDescription, separatorPosition: .none)
        rowView.setupTitleDescriptionLabelWith(text: NSLocalizedString("ClassCardContent_Syllabus", comment: ""))
        rowView.setupLeftAccessory(named: "book_Classes")
        rowView.setupTextColor(as: .customDarkGrayText)
        
        return rowView
    }()
    
    private lazy var rowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        return stackView
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView(frame: .zero)
        mapView.layer.cornerRadius = cornerRadius
        centerMapOnAGH(for: mapView)
        return mapView
    }()
    private lazy var showRouteButton: UIButton = {
        let button = AGHButton(title: NSLocalizedString("ClassCardContent_ShowRoute", comment: "")).build()
        button.addTarget(self, action: #selector(onPressOpenNavigation), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup view methods
    
    public func setupUI() {
        setupUIProperties()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        addSubview(subjectNameLabel)
        addSubview(separator)
        addSubview(subjectTypeLabel)
        addSubview(rowStackView)
        addSubview(mapView)
        addSubview(showRouteButton)
        
        rowStackView.addArrangedSubview(classHoursRowView)
        rowStackView.addArrangedSubview(teacherRowView)
        rowStackView.addArrangedSubview(buildingRowView)
        rowStackView.addArrangedSubview(ectsNumberRowView)
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        
        subjectNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(spacing)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        separator.snp.makeConstraints { (make) in
            make.top.equalTo(subjectNameLabel.snp.bottom).offset(spacing)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        subjectTypeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separator.snp.bottom).offset(spacingInRows)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        rowStackView.snp.makeConstraints { (make) in
            make.top.equalTo(subjectTypeLabel.snp.bottom).offset(spacingInRows)
            make.left.right.equalToSuperview()
        }
        
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(rowStackView.snp.bottom).offset(spacing)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(leftMargin)
            make.right.equalToSuperview().offset(rightMargin)
            make.bottom.equalTo(showRouteButton.snp.top).offset(-spacing)
        }
        
        showRouteButton.snp.makeConstraints { (make) in
            make.width.equalTo(160)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-spacing)
        }
    }
    
    // MARK: - Adaptation to the iPhone 8 and below
    
    private func setupUIProperties() {
        
        if UIScreen.isSmallSize() {
            spacing = screenHeight * 0.02
            spacingInRows = screenHeight * 0.01
            subjectNameLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            subjectTypeLabel.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        }
        else if UIScreen.isMediumSize(){
            spacing = screenHeight * 0.025
            spacingInRows = screenHeight * 0.01
            subjectNameLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            subjectTypeLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        }
    }
    
    // MARK: - Open map
    
    private func centerMapOnAGH(for map: MKMapView) {
        let initialLocation = CLLocation(latitude: 50.064552, longitude: 19.923064)
        let regionRadius: CLLocationDistance = 200
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - Selectors
    
    @objc private func onPressOpenNavigation() {
        openNavigation?()
    }
}

extension ClassCardView {
    
    // MARK: - Public Methods
    
    public func setSubjectNameLabelWith(text: String) {
        subjectNameLabel.text = text
    }
    
    public func setSubjectTypeNameLabelWith(text: String) {
        subjectTypeLabel.text = text
    }
    
    public func setClassHoursLabelWith(text: String) {
        classHoursRowView.setupTitle(as: text)
    }
    
    public func setGroupNameLabelWith(text: String) {
        classHoursRowView.setupTitleDescriptionLabelWith(text: text)
    }
    
    public func setTeacherNameLabelWith(text: String) {
        teacherRowView.setupTitle(as: text)
    }
    
    public func setBuildingNameLabelWith(text: String) {
        buildingRowView.setupTitle(as: text)
    }
    
    public func setClassroomNumberLabelWith(text: String) {
        buildingRowView.setupTitleDescriptionLabelWith(text: text)
    }
    
    public func setECTSNumberLabelWith(text: String) {
        ectsNumberRowView.setupTitle(as: text)
    }
}
