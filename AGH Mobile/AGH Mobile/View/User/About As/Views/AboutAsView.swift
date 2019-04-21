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
        self.backgroundColor = #colorLiteral(red: 0.9672492146, green: 0.9614989161, blue: 0.9716691375, alpha: 1)
        self.addSubview(teamGallery)
        self.addSubview(aboutAsDescription)
        self.addSubview(iconOfMacKN)
        self.addSubview(webPageButton)
    }
    
    private func setupConstraints() {
        setupTeamGalleryConstraints()
        setupAboutAsDescriptionConstraints()
        setupIconOfMacKNConstraints()
        setupWebPageButtonConstraints()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Elements of View:
    
    // Team Gallery
    private let teamGallery: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    // Constraints
    fileprivate func setupTeamGalleryConstraints() {
        teamGallery.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            teamGallery.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                             constant: self.frame.height * 0.064),
            teamGallery.leftAnchor.constraint(equalTo: self.leftAnchor),
            teamGallery.rightAnchor.constraint(equalTo: self.rightAnchor),
            teamGallery.heightAnchor.constraint(equalToConstant: self.frame.height*0.205)
            ])
    }
    
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
    
    // Constraints
    fileprivate func setupAboutAsDescriptionConstraints() {
        aboutAsDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutAsDescription.topAnchor.constraint(equalTo: teamGallery.bottomAnchor,
                                                    constant: self.frame.height * 0.05),
            aboutAsDescription.bottomAnchor.constraint(equalTo: iconOfMacKN.topAnchor,
                                                       constant: self.frame.height * -0.016),
            aboutAsDescription.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                     constant: 16),
            aboutAsDescription.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                      constant: -16),
            ])
    }
    
    // MacKN Icon
    private let iconOfMacKN: UIImageView = {
        let image = UIImage(named: "MacKNIcon")
        let icon = UIImageView(image: image)
        //more setups
        return icon
    }()
    
    // Constraints
    fileprivate func setupIconOfMacKNConstraints() {
        iconOfMacKN.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconOfMacKN.bottomAnchor.constraint(equalTo: webPageButton.topAnchor,
                                                constant: self.frame.height * -0.0369),
            iconOfMacKN.widthAnchor.constraint(equalTo: iconOfMacKN.heightAnchor,
                                               multiplier: iconOfMacKN.frame.width / iconOfMacKN.frame.height),
            iconOfMacKN.heightAnchor.constraint(equalToConstant: self.frame.height * 0.123),
            iconOfMacKN.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
            ])
    }
    
    // Web Page Button
    private let webPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("strona internetowa koła", for: .normal)
        button.setTitleColor(UIColor(red: 181/255, green: 101/255, blue: 101/255, alpha: 1), for: .normal)
        return button
    }()
    
    // Constraints
    fileprivate func setupWebPageButtonConstraints() {
        webPageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webPageButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: self.frame.height * -0.08374),
            webPageButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
            ])
    }
    
}
