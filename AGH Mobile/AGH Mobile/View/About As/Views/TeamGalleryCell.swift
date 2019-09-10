//
//  TeamGalleryCell.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 30/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class TeamGalleryCell: UICollectionViewCell {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    public static let identifier = "teamGalleryCell"
    private lazy var memberPhotoImageHight = self.frame.height * 0.75
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup View Methods
    
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.addSubview(memberPhoto)
        self.addSubview(memberName)
        self.addSubview(memberSpecialization)
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
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Member Photo
    private lazy var memberPhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = memberPhotoImageHight / 2
        image.backgroundColor = .clear
        return image
    }()
    
    // Member Name
    private lazy var memberName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .customGrayText
        label.text = "robb stark".uppercased()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    // Member Specialization
    private lazy var memberSpecialization: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .mainRed
        label.text = "king of the north".uppercased()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
    
        // Member Photo
        memberPhoto.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(memberPhotoImageHight)
            make.width.equalTo(memberPhoto.snp.height)
            make.bottom.lessThanOrEqualTo(memberName.snp.top).offset(self.frame.height * -0.1).priority(.low)
        }

        // Member Name
        memberName.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(memberSpecialization.snp.top).offset(self.frame.height * -0.0125).priority(.required)
        }

        // Member Specialization
        memberSpecialization.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).priority(.required)
        }
        
    }
    
}
