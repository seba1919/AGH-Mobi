//
//  DescriptionTextView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 17/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

final class DescriptionTextView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    private let descriptionTextView: UITextView
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    init(text: String) {
        descriptionTextView = UITextView()
        descriptionTextView.isEditable = false
        descriptionTextView.text = text
        descriptionTextView.textAlignment = .left
        descriptionTextView.textColor = UIColor(red: 147/255, green: 147/255, blue: 147/255, alpha: 1)
        descriptionTextView.font = descriptionTextView.font?.withSize(16)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public methods
    
    public func build() -> UITextView {
        return descriptionTextView
    }
    
}
