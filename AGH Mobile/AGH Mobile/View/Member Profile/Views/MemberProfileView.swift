//
//  MemberProfileView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 01/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class MemberProfileView: UIView {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth =  self.frame.width
    private lazy var memberPhotoImageHight = screenHeight * 0.222
    private lazy var topPadding = screenHeight * 0.03
    // Table View
    private let cellNumber = 3 //CHANGE!
        
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
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.addSubview(memberPhoto)
        self.addSubview(memberName)
        self.addSubview(memberSpecialization)
        self.addSubview(memberDescription)
        self.addSubview(memberWebPageView)
        memberWebPageView.addSubview(memberWebPages)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    public func setupImage(named Name: String) {
        memberPhoto.image = UIImage(named: Name)
    }
    
    public func setupName(as Name: String) {
        memberName.text = Name
    }
    
    public func setupSpecialization(as Name: String) {
        memberSpecialization.text = Name
    }
    
    public func setupDescription(on text: String) {
        memberDescription.text = text
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Member Photo
    private lazy var memberPhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = ContentMode.scaleAspectFill
        image.layer.cornerRadius = memberPhotoImageHight / 2
        image.backgroundColor = .clear
        return image
    }()
    
    // Member Name
    private lazy var memberName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = "robb stark".uppercased()
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        return label
    }()
    
    // Member Specialization
    private lazy var memberSpecialization: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .mainRed
        label.text = "king of the north".uppercased()
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        return label
    }()
    
    // Member Description
    private lazy var memberDescription: UITextView = {
        let descriptionTextView = DescriptionTextView(
            text: """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a nulla vel sapien accumsan mollis.
            Suspendisse neque justo, gravida sed sem tempus, porttitor semper nisi.
            """)
            .build()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionTextView
    }()
    
    // Member WebPageView
    private lazy var memberWebPageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    // Member WebPages
    public private(set) lazy var memberWebPages: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.isScrollEnabled = false
        tableView.separatorColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    private func setupConstraints() {
        
        // Member Photo
        memberPhoto.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.height.equalTo(memberPhotoImageHight)
            make.width.equalTo(memberPhoto.snp.height)
        }
        
        // Member Name
        memberName.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(memberPhoto.snp.bottom).offset(screenHeight * 0.0425).priority(.low)
        }
        
        // Member Specialization
        memberSpecialization.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(memberName.snp.bottom).offset(screenHeight * 0.01)
        }
        
        // Member Description
        memberDescription.snp.makeConstraints { (make) in
            make.top.equalTo(memberSpecialization.snp.bottom).offset(screenHeight * 0.03)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        // Member WebPagesView
        memberWebPageView.snp.makeConstraints { (make) in
            make.top.equalTo(memberDescription.snp.bottom).offset(screenWidth * 0.01)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).offset(screenHeight * -0.1)
        }
        
        // member WebPages
        memberWebPages.snp.makeConstraints { (make) in
            make.centerY.equalTo(memberWebPageView.snp.centerY)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Int(MemberWebPagesCell.cellHeight) * cellNumber)
        }
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Selectors
    
    
}
