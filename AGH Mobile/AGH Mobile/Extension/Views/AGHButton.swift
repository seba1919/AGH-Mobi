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
        AGHButton = UIButton()
        AGHButton.setTitle(title, for: .normal)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupLayout() {
        AGHButton.layer.cornerRadius = 25
        AGHButton.backgroundColor = .mainRed
        AGHButton.setTitleColor(.white, for: .normal)
        AGHButton.titleLabel?.textAlignment = .center
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
