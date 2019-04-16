//
//  AboutAsView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 16/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

public class AboutAsView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    lazy var teamScrollView = TeamScrollView()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupUI() {
        backgroundColor = .white
    }
    
    private func setupTeamScrollViewConstraint() {
        teamScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            teamScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            teamScrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            teamScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 150)
            ])
    }
    
}


