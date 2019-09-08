//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class AboutUsView: UIView {
    
    // MARK: - Public properties
    var openWebPage: (() -> Void)?
    // MARK: - Private properties
    private lazy var freeSpaceBetweenComponents = self.frame.height * 0.0225
    private lazy var topPadding = self.frame.height * 0.047
    private lazy var bottomPadding = self.frame.height * -0.030
    
    // MARK: - Components of View
    private(set) lazy var teamGalleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    private lazy var aboutUsDescriptionTextView: UITextView = {
        let descriptionTextView = DescriptionTextView(
            text: NSLocalizedString("AboutUsView_AboutUsDescription", comment: ""))
            .build()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionTextView
    }()
    
    private lazy var macKnIconImageView: UIImageView = {
        let image = UIImage(named: "MacKNIcon")
        let icon = UIImageView(image: image)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var webPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("AboutUsView_StudentScienceCircleWebPage", comment: ""), for: .normal)
        button.setTitleColor(UIColor.mainRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onPressOpenWeb), for: .touchUpInside)
        return button
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AboutUsView {
    
    // MARK: - Setup view
    public func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(teamGalleryCollectionView)
        self.addSubview(aboutUsDescriptionTextView)
        self.addSubview(macKnIconImageView)
        self.addSubview(webPageButton)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        teamGalleryCollectionView.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(self.frame.height * 0.0685).priority(.high)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.bottom.equalTo(aboutUsDescriptionTextView.snp.top).offset(-freeSpaceBetweenComponents)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        aboutUsDescriptionTextView.snp.makeConstraints { (make) in
            make.bottom.equalTo(macKnIconImageView.snp.top).offset(-freeSpaceBetweenComponents)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        macKnIconImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(webPageButton.snp.top).offset(-freeSpaceBetweenComponents)
            // Adaptation to the iPhone SE
            if UIScreen.isSmallSize() {
                make.height.equalTo(self.frame.height * 0.07)
            } else {
                make.height.equalTo(self.frame.height * 0.123)
            }
            make.width.equalTo(macKnIconImageView.snp.height).multipliedBy(macKnIconImageView.frame.width / macKnIconImageView.frame.height)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        webPageButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(bottomPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    
    // MARK: - Selectors
    @objc private func onPressOpenWeb() {
        openWebPage?()
    }
}
