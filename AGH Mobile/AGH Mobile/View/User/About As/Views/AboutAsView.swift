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
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 0.9908361106, green: 1, blue: 0.4055597723, alpha: 1)
        self.addSubview(teamGallery)
        self.addSubview(aboutAsDescription)
    }
    
    private func setupConstraints() {
        // Team Gallery
        teamGallery.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            teamGallery.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                             constant: frame.height * 0.064),
            teamGallery.leftAnchor.constraint(equalTo: self.leftAnchor),
            teamGallery.rightAnchor.constraint(equalTo: self.rightAnchor),
            teamGallery.heightAnchor.constraint(equalToConstant: frame.height*0.205)
            ])
        
        // About As Description
        aboutAsDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutAsDescription.topAnchor.constraint(equalTo: teamGallery.bottomAnchor,
                                                    constant: frame.height * 0.05),
            aboutAsDescription.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                     constant: 16),
            aboutAsDescription.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                      constant: -16),
            aboutAsDescription.heightAnchor.constraint(equalToConstant: 220)
            ])
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Elements of View
    
    let teamGallery: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    let aboutAsDescription: UITextView = {
        let descriptionTextView = DescriptionTextView(
            text: """
            Aplikacja powstała w ramach działania koła naukowego MacKN i nie jest oficjalną aplikacją Akademii Górniczo-Hutniczej w Krakowie.

            Koło Naukowe MacKN zrzesza pasjonatów programowania na iOS i macOS oraz pasjonatów fotografii. Działamy przy Katedrze Informatyki Stosowanej Wydziału Elektrotechniki, Automatyki, Informatyki i Inżynierii Biomedycznej Akademii Górniczo-Hutniczej im. Stanisława Staszica w Krakowie.
            """)
            .build()
        return descriptionTextView
    }()
    
}


