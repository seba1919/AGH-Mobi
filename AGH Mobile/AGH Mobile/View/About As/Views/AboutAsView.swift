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
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

final class AboutAsView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    private lazy var freeSpaceBetweenComponents = self.frame.height * 0.0225
    private lazy var topPadding = self.frame.height * 0.047
    private lazy var bottomPadding = self.frame.height * -0.030
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup view methods
    
    public func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(teamGallery)
        self.addSubview(aboutAsDescription)
        self.addSubview(iconOfMacKN)
        self.addSubview(webPageButton)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Team Gallery
    // Public bo w VC trzeba się dostać do tego (?)
    public private(set) lazy var teamGallery: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    // About as Description
    private lazy var aboutAsDescription: UITextView = {
        let descriptionTextView = DescriptionTextView(
            text: """
            Aplikacja powstała w ramach działania koła naukowego MacKN i nie jest oficjalną aplikacją Akademii Górniczo-Hutniczej w Krakowie.

            Koło Naukowe MacKN zrzesza pasjonatów programowania na iOS i macOS oraz pasjonatów fotografii. Działamy przy Katedrze Informatyki Stosowanej Wydziału Elektrotechniki, Automatyki, Informatyki i Inżynierii Biomedycznej Akademii Górniczo-Hutniczej im. Stanisława Staszica w Krakowie.
            """)
            .build()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionTextView
    }()
    
    // MacKN Icon
    private lazy var iconOfMacKN: UIImageView = {
        let image = UIImage(named: "MacKNIcon")
        let icon = UIImageView(image: image)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    // Web Page Button
    private lazy var webPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("strona internetowa koła", for: .normal)
        button.setTitleColor(UIColor.mainRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    private func setupConstraints() {
        
        // Team Gallery
        teamGallery.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(self.frame.height * 0.0685).priority(.high)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.bottom.equalTo(aboutAsDescription.snp.top).offset(-freeSpaceBetweenComponents)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }

        // About As Description
        aboutAsDescription.snp.makeConstraints { (make) in
            make.bottom.equalTo(iconOfMacKN.snp.top).offset(-freeSpaceBetweenComponents)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }

        // Icon Of MacKN
        iconOfMacKN.snp.makeConstraints { (make) in
            make.bottom.equalTo(webPageButton.snp.top).offset(-freeSpaceBetweenComponents)
            make.height.equalTo(self.frame.height * 0.123)
            make.width.equalTo(iconOfMacKN.snp.height).multipliedBy(iconOfMacKN.frame.width / iconOfMacKN.frame.height)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        // Web Page Button
        webPageButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(bottomPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
}
