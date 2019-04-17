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
    
    lazy var teamGallery = UIView()
    
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
        setupView()
        setupteamGallery()
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupteamGallery() {
        teamGallery.backgroundColor = .yellow
        self.addSubview(teamGallery)
        
        teamGallery.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            teamGallery.topAnchor.constraint(equalTo: self.topAnchor),
            teamGallery.leftAnchor.constraint(equalTo: self.leftAnchor),
            teamGallery.rightAnchor.constraint(equalTo: self.rightAnchor),
            teamGallery.heightAnchor.constraint(equalToConstant: 200)
            ])
    }
}


