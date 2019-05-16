//
//  AGHButton.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 03/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

final class AGHButton {
 
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    // Button
    private let AGHButton: UIButton
    // Styles
    public enum Style {
        case normal
        case withLeftAccessory
    }
    // Components of view
    private lazy var title: UILabel = {
        let lebel = UILabel()
        lebel.translatesAutoresizingMaskIntoConstraints = false
        lebel.textColor = .white
        lebel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        lebel.textAlignment = .center
        return lebel
    }()
    
    private lazy var leftAccesory: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    init(title: String, style: Style = .normal, leftAccesoryName: String? = nil) {
        AGHButton = UIButton(type: .system)
        self.title.text = title
        if (leftAccesoryName != nil) {
            leftAccesory.image = UIImage(named: leftAccesoryName ?? "star")
        }
        
        switch style {
        case .normal: setupNormalStyle()
        case .withLeftAccessory: setupWithLeftAccessoryStyle()
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    // Common Properties
    private func setupCommonProperties() {
        setupHeightConstraintsAndCornerRadius()
        AGHButton.translatesAutoresizingMaskIntoConstraints = false
        AGHButton.backgroundColor = .mainRed
    }
    
    // Styles
    private func setupNormalStyle() {
        setupCommonProperties()
        AGHButton.addSubview(title)
        setupNormalConstraints()
    }
    
    private func setupWithLeftAccessoryStyle() {
        setupCommonProperties()
        AGHButton.addSubview(title)
        AGHButton.addSubview(leftAccesory)
        setupWithLeftAccessoryConstraints()
    }
    
    // Constraints
    private func setupNormalConstraints() {
        title.snp.makeConstraints { (make) in
            make.centerX.equalTo(AGHButton.snp.centerX)
            make.centerY.equalTo(AGHButton.snp.centerY)
        }
    }
    
    private func setupWithLeftAccessoryConstraints() {
        let leftAccesoryHeight: CGFloat = 17
        let freeSpace: CGFloat = 5
        title.snp.makeConstraints { (make) in
            make.centerY.equalTo(AGHButton)
            make.centerX.equalTo(AGHButton).offset(leftAccesoryHeight/2 + freeSpace/2)
        }
        leftAccesory.snp.makeConstraints { (make) in
            make.right.equalTo(title.snp.left).offset(-freeSpace)
            make.centerY.equalTo(AGHButton)
            make.size.equalTo(CGSize(width: leftAccesoryHeight, height: leftAccesoryHeight))
        }
    }
    
    private func setupHeightConstraintsAndCornerRadius() {
        let screenHeight = UIScreen.main.bounds.height
        var halfOfHeight: CGFloat = 26
        
        if (screenHeight < 569) {
            halfOfHeight = 17
            title.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        } else if (screenHeight > 569 && screenHeight < 668) {
            halfOfHeight = 22
        } else if (screenHeight > 668 && screenHeight < 737) {
            halfOfHeight = 24
        } else if screenHeight > 737 {
            halfOfHeight = 26
        }
        AGHButton.layer.cornerRadius = halfOfHeight
        AGHButton.snp.makeConstraints { (make) in
            make.height.equalTo(halfOfHeight * 2)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    public func build() -> UIButton {
        return AGHButton
    }
    
}
