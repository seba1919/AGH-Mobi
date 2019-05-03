//
//  UserSettingsContent.swift
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

class UserSettingsContent: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    // Private
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth =  self.frame.width
    // Public
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup view methods
    
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.addSubview(sectionTitle)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Section Title
    private lazy var sectionTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .customGrayText
        label.text = "INTEGRACJA KONT".uppercased()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        // Section Title
        sectionTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
        }
        
        
    }
    
}

