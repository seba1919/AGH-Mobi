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
        setupTeamGallery()
        setupAboutAsDescription()
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupTeamGallery() {
        teamGallery.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.addSubview(teamGallery)
        
        teamGallery.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            teamGallery.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: frame.height * 0.064),
            teamGallery.leftAnchor.constraint(equalTo: self.leftAnchor),
            teamGallery.rightAnchor.constraint(equalTo: self.rightAnchor),
            teamGallery.heightAnchor.constraint(equalToConstant: frame.height*0.205)
            ])
    }
    
    private func setupAboutAsDescription() {
        let aboutAsDescription = DescriptionTextView(
            text: """
            Aplikacja powstała w ramach działania koła naukowego MacKN i nie jest oficjalną aplikacją Akademii Górniczo-Hutniczej w Krakowie.

            Koło Naukowe MacKN zrzesza pasjonatów programowania na iOS i macOS oraz pasjonatów fotografii. Działamy przy Katedrze Informatyki Stosowanej Wydziału Elektrotechniki, Automatyki, Informatyki i Inżynierii Biomedycznej Akademii Górniczo-Hutniczej im. Stanisława Staszica w Krakowie.
            """)
            .build()
        self.addSubview(aboutAsDescription)
        
        aboutAsDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutAsDescription.topAnchor.constraint(equalTo: teamGallery.bottomAnchor, constant: frame.height * 0.05),
            aboutAsDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7),
            aboutAsDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -7),
            aboutAsDescription.heightAnchor.constraint(equalToConstant: 220)
            ])
    }
    
}


