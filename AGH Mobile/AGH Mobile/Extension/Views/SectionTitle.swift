//
//  SectionTitle.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 09/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

final class SectionTitle {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    private let sectionTitle: UILabel
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    init(title: String) {
        sectionTitle = UILabel()
        sectionTitle.text = title
        self.setupLayout()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupLayout() {
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.textAlignment = .left
        sectionTitle.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        sectionTitle.textColor = .customGrayText
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public methods
    
    public func build() -> UILabel {
        return sectionTitle
    }
    
}

