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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupLayout() {
        self.setupCornerRadius()
        AGHButton.backgroundColor = .mainRed
        AGHButton.setTitleColor(.white, for: .normal)
        AGHButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        AGHButton.titleLabel?.textAlignment = .center
    }
    
    private func setupCornerRadius() {
        if UIScreen.main.bounds.height < 668 {
            AGHButton.layer.cornerRadius = 22
        } else if (UIScreen.main.bounds.height > 668 && UIScreen.main.bounds.height < 737) {
            AGHButton.layer.cornerRadius = 24
        } else if UIScreen.main.bounds.height > 737 {
            AGHButton.layer.cornerRadius = 26
        }
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