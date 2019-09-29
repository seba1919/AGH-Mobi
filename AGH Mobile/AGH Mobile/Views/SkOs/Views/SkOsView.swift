//
//  SkOsView.swift
//  AGH Mobile
//
//  Created by macbook on 19/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit
import SnapKit

class SkOsView: UIView {
    
    // MARK: - Private properties
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    
    // MARK: - Components of View
    private lazy var tabBatTitle: UILabel = {
        let label = TabBarPageTitleLabel(
            title: NSLocalizedString("InformationsView_Information", comment: ""))
            .build()
        return label
    }()
    
    private lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .mainRed
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var sectionTitle: UILabel = {
        let label = SectionTitle(
            title: NSLocalizedString("InformationsView_StudiesInformation", comment: ""))
            .build()
        return label
    }()
    
    public private(set) lazy var informationContent: InformationContent = {
        let view = InformationContent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SkOsView {
    
    // MARK: - Setup View
    public func setupUI() {
        setupViews()
        setupConstraints()
        
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.addSubview(informationContent)
    }
   
    // MARK: - Setup Constraints
    private func setupConstraints() {
       
    }
    
}
