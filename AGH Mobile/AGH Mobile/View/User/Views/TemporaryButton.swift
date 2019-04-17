//
//  TemporaryButton.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 16/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class TemporaryButton {
    
    private let button: UIButton
    
    init(title: String) {
        button = UIButton()
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    // MARK: - Public methods
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) -> Self {
        button.addTarget(target, action: action, for: event)
        
        return self
    }
    
    func build() -> UIButton {
        return button
    }
    
    private func setupUI() {
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
    }
    
}
