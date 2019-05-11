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
    
    private let AGHButton: UIButton
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    init(title: String) {
        AGHButton = UIButton(type: .system)
        AGHButton.setTitle(title, for: .normal)
        self.setupLayout()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupLayout() {
        self.setupConstraintsAndCornerRadius()
        AGHButton.translatesAutoresizingMaskIntoConstraints = false
        AGHButton.backgroundColor = .mainRed
        AGHButton.setTitleColor(.white, for: .normal)
        AGHButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        AGHButton.titleLabel?.textAlignment = .center
    }
    
    private func setupConstraintsAndCornerRadius() {
        let screenHeight = UIScreen.main.bounds.height
        var height: CGFloat = 26
        
        if (screenHeight < 569) {
            height = 17
            AGHButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        } else if (screenHeight > 569 && screenHeight < 668) {
            height = 22
        } else if (screenHeight > 668 && screenHeight < 737) {
            height = 24
        } else if screenHeight > 737 {
            height = 26
        }
        AGHButton.snp.makeConstraints { (make) in
            make.height.equalTo(height * 2)
        }
        AGHButton.layer.cornerRadius = height
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    public func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) -> Self {
        AGHButton.addTarget(target, action: action, for: event)
        return self
    }
    
    public func build() -> UIButton {
        return AGHButton
    }
    
}
