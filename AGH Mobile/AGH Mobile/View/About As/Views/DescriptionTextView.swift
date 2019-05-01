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
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.text = text
        descriptionTextView.textAlignment = .justified
        descriptionTextView.textColor = UIColor.customGrayText
        
        if UIScreen.main.bounds.height < 668 {
            descriptionTextView.font = descriptionTextView.font?.withSize(12.5)
        } else if (UIScreen.main.bounds.height > 668 && UIScreen.main.bounds.height < 737) {
            descriptionTextView.font = descriptionTextView.font?.withSize(13.6)
        } else if UIScreen.main.bounds.height > 737 {
            descriptionTextView.font = descriptionTextView.font?.withSize(15)
        }
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public methods
    
    public func build() -> UITextView {
        return descriptionTextView
    }
    
}



