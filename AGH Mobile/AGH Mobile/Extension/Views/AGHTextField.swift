//
//  AGHTextField.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 07/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

final class AGHTextField: UITextField {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    private var placeholderText: String = "Text..."
    private var height: CGFloat = 26
    private let textPadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    private let rightViewPadding: CGFloat = 8
    
    private lazy var customPlaceholder: NSAttributedString = {
        let placeholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.mainRed,
                         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium)])
        return placeholder
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init

    required init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholderText = placeholder
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setups
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .mainRed
        self.backgroundColor = .white
        self.borderStyle = .none
        self.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        self.autocorrectionType = UITextAutocorrectionType.no
        self.attributedPlaceholder = customPlaceholder
        self.clearButtonMode = .always
        self.setupLayer()
        self.setupConstraints()
    }
    
    private func setupLayer() {
        self.layer.borderWidth = 2.5
        self.layer.borderColor = UIColor.mainRed.cgColor
        self.layer.masksToBounds = true
        self.setupCornerRadius()
    }
    
    private func setupCornerRadius() {
        
        let screenHight = UIScreen.main.bounds.height
        if (screenHight < 569) {
            height = 17
            self.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        } else if (screenHight > 569 && screenHight < 668) {
            height = 22
        } else if (screenHight > 668 && screenHight < 737) {
            height = 24
        } else if screenHight > 737 {
            height = 26
        }
        self.layer.cornerRadius = height

    }
    
    private func setupConstraints() {
        self.snp.makeConstraints { (make) in
            make.height.equalTo(height * 2)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Override methods
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
}

