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

final class AboutAsView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    private lazy var freeSpaceBetweenComponents = self.frame.height * 0.0225
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        self.addSubview(teamGallery)
        self.addSubview(aboutAsDescription)
        self.addSubview(iconOfMacKN)
        self.addSubview(webPageButton)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View:
    
    // Team Gallery
    private let teamGallery: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    // About as Description
    private let aboutAsDescription: UITextView = {
        let descriptionTextView = DescriptionTextView(
            text: """
            Aplikacja powstała w ramach działania koła naukowego MacKN i nie jest oficjalną aplikacją Akademii Górniczo-Hutniczej w Krakowie.

            Koło Naukowe MacKN zrzesza pasjonatów programowania na iOS i macOS oraz pasjonatów fotografii. Działamy przy Katedrze Informatyki Stosowanej Wydziału Elektrotechniki, Automatyki, Informatyki i Inżynierii Biomedycznej Akademii Górniczo-Hutniczej im. Stanisława Staszica w Krakowie.
            """)
            .build()
        return descriptionTextView
    }()
    
    // MacKN Icon
    private let iconOfMacKN: UIImageView = {
        let image = UIImage(named: "MacKNIcon")
        let icon = UIImageView(image: image)
        //more setups?
        return icon
    }()
    
    // Web Page Button
    private let webPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("strona internetowa koła", for: .normal)
        button.setTitleColor(UIColor(red: 181/255, green: 101/255, blue: 101/255, alpha: 1), for: .normal)
        return button
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    fileprivate func setupConstraints() {
        
        teamGallery.translatesAutoresizingMaskIntoConstraints = false
        aboutAsDescription.translatesAutoresizingMaskIntoConstraints = false
        iconOfMacKN.translatesAutoresizingMaskIntoConstraints = false
        webPageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Team Gallery
            teamGallery.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                             constant: self.frame.height * 0.047),
            teamGallery.bottomAnchor.constraint(equalTo: aboutAsDescription.topAnchor,
                                                constant: self.frame.height * -0.045),
            teamGallery.leftAnchor.constraint(equalTo: self.leftAnchor),
            teamGallery.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            
            // About As Description
            aboutAsDescription.bottomAnchor.constraint(equalTo: iconOfMacKN.topAnchor,
                                                       constant: -freeSpaceBetweenComponents),
            aboutAsDescription.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                     constant: 16),
            aboutAsDescription.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                      constant: -16),
            
            
            // Icon Of MacKN
            iconOfMacKN.bottomAnchor.constraint(equalTo: webPageButton.topAnchor,
                                                constant: -freeSpaceBetweenComponents),
            iconOfMacKN.heightAnchor.constraint(equalToConstant: self.frame.height * 0.123),
            iconOfMacKN.widthAnchor.constraint(equalTo: iconOfMacKN.heightAnchor,
                                               multiplier: iconOfMacKN.frame.width / iconOfMacKN.frame.height),
            iconOfMacKN.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            // Web Page Button
            webPageButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: self.frame.height * -0.047),
            webPageButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
            ])
    }
}
