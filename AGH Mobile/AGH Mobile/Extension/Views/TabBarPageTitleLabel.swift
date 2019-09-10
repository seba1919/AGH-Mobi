//
//  TabBarPageTitleLabel.swift
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

final class TabBarPageTitleLabel {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    private let tabBarPageTitle: UILabel
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    init(title: String) {
        tabBarPageTitle = UILabel()
        tabBarPageTitle.text = title
        self.setupLayout()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupLayout() {
        tabBarPageTitle.translatesAutoresizingMaskIntoConstraints = false
        tabBarPageTitle.textAlignment = .center
        tabBarPageTitle.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        tabBarPageTitle.textColor = .black
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public methods
    
    public func build() -> UILabel {
        return tabBarPageTitle
    }
    
}
