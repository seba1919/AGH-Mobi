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
        descriptionTextView.text = text
        self.setupLayout()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupLayout() {
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.textAlignment = .justified
        descriptionTextView.textColor = UIColor.customGrayText
        
        let screenHeight = UIScreen.main.bounds.height
        var fontSize: CGFloat = 15
        
        if (screenHeight < 569) {
            fontSize = 12
        } else if (screenHeight > 569 && screenHeight < 668) {
            fontSize = 12.5
        } else if (screenHeight > 668 && screenHeight < 737) {
            fontSize = 13.6
        } else if screenHeight > 737 {
            fontSize = 15
            descriptionTextView.textAlignment = .center // justified looks awfully
        }
        descriptionTextView.font = descriptionTextView.font?.withSize(fontSize)

    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public methods
    
    public func build() -> UITextView {
        return descriptionTextView
    }
    
}



