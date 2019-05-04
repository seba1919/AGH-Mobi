//
//  SeparatorView.swift
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

final class SeparatorView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    private let separator: UIView
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    init() {
        separator = UIView()
        self.setupLayout()
        self.setupConstraints()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupLayout() {
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
    }
    
    private func setupConstraints() {
        separator.snp.makeConstraints { (make) in
            make.height.equalTo(1)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    public func build() -> UIView {
        return separator
    }
    
}
