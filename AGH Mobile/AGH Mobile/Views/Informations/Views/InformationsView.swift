//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class InformationsView: UIView {
    
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

extension InformationsView {
    
    // MARK: - Setup View
    public func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.addSubview(tabBatTitle)
        self.addSubview(mainImage)
        self.addSubview(sectionTitle)
        self.addSubview(informationContent)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        tabBatTitle.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        mainImage.snp.makeConstraints { (make) in
            make.top.equalTo(tabBatTitle.snp.bottom).offset(screenHeight * 0.02)
            make.width.equalToSuperview()
            make.height.equalTo(screenHeight * 0.25)
        }
        
        sectionTitle.snp.makeConstraints { (make) in
            make.top.equalTo(mainImage.snp.bottom).offset(screenHeight * 0.036)
            make.left.equalToSuperview().offset(20)
        }
        
        informationContent.snp.makeConstraints { (make) in
            make.top.equalTo(sectionTitle.snp.bottom).offset(screenHeight * 0.012)
            make.left.right.equalToSuperview()
        }
    }
}
