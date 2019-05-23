//
//  ClassesCell.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 21/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class ClassesCell: UITableViewCell {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    // Public
    public static let identifier = "classesCell"
    public static let cellHeight = 54
    // Private
    private let leftMargin: CGFloat = 30.0
    private let rightMargin: CGFloat = -30.0
    private let topPadding: CGFloat = 7.0
    private let bottomPadding: CGFloat = -7.0
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup view methods
    
    private func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(shortcutNameOfType)
        self.addSubview(nameOfActivities)
        self.addSubview(timeOfActivities)
        self.addSubview(placeOfActivities)
        self.addSubview(countingDownOfActivities)
        self.addSubview(rightAccessory)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Shortcut Type of Classes
    private lazy var shortcutNameOfType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .shortcutDarkGray
        label.text = "ĆL"
        return label
    }()
    
    // Name Of Activities
    private lazy var nameOfActivities: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.text = "Bazy danych"
        return label
    }()
    
    // Time Of Activities
    private lazy var timeOfActivities: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .customGrayText
        label.text = "8:00 - 9:30"
        return label
    }()
    
    // Place Of Activities
    private lazy var placeOfActivities: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .customGrayText
        label.textAlignment = .right
        label.text = "C-2 208"
        return label
    }()
    
    // CountingDown Of Activities
    private lazy var countingDownOfActivities: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .customGrayText
        label.textAlignment = .right
        label.text = "Za 4 godziny"
        return label
    }()
    
    // Right Accessory
    private lazy var rightAccessory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "arrow_right")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.8392156863, alpha: 1)
        return imageView
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    private func setupConstraints() {
        
        // Shortcut Type of Classes
        shortcutNameOfType.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(leftMargin)
            make.centerY.equalTo(self)
        }
        
        // Name Of Activities
        nameOfActivities.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(topPadding)
            make.left.equalTo(shortcutNameOfType.snp.right).offset(15)
        }
        
        // Time Of Activities
        timeOfActivities.snp.makeConstraints { (make) in
            //make.top.equalTo(nameOfActivities.snp.bottom).offset(2)
            make.left.equalTo(shortcutNameOfType.snp.right).offset(15)
            make.bottom.equalTo(self).offset(bottomPadding)
        }
        
        // Place Of Activities
        placeOfActivities.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameOfActivities)
            make.right.equalTo(self).offset(rightMargin)
        }
        
        // CountingDown Of Activities
        countingDownOfActivities.snp.makeConstraints { (make) in
            make.centerY.equalTo(timeOfActivities)
            make.right.equalTo(self).offset(rightMargin)
        }
        
        // Right Accessory
        rightAccessory.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(placeOfActivities.snp.right).offset(10)
        }
        
    }
    
}
