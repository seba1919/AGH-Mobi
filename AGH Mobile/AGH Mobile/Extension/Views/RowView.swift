//
//  RowView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 03/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

final class RowView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    private var topPadding: CGFloat = 5
    private var bottomPadding: CGFloat = -5
    private var fontSize: CGFloat = 17
    
    // Styles
    enum Style {
        case normal
    }
    
    // Separator Position
    enum SeparatorPosition {
        case top
        case bottom
        case topAndBottom
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init

    required init(style: Style = .normal, separatorPosition: SeparatorPosition = .top){
        super.init(frame: CGRect.zero)
        self.adjustSizes()
        
        switch style {
        case .normal: setupNormalStyle()
        }
        
        switch separatorPosition {
        case .top: setupTopSeparator()
        case .bottom: setupBottomSeparator()
        case .topAndBottom: setupTopAndBottomSeparators()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setups
    
    // Setups for Styles
    
    private func setupNormalStyle() {
        self.addSubview(title)
        self.addSubview(rightImage)
        self.setupNormalStyleConstraints()
    }
    
    // Setups for Separators
    
    private func setupTopSeparator() {
        self.addSubview(topSeparator)
        self.setupTopSeparatorConstraints()
    }
    
    private func setupBottomSeparator() {
        self.addSubview(bottomSeparator)
        self.setupBottomSeparatorConstraints()
    }
    
    private func setupTopAndBottomSeparators() {
        self.setupTopSeparator()
        self.setupBottomSeparator()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Adjustment of size to resolution
    
    private func adjustSizes() {
        // Iphones 6, 6s, 7, 8
        if UIScreen.main.bounds.height < 668 {
            self.setupVariables(topPadding: 3,
                                bottomPadding: -3,
                                fontSize: 15)
        // Iphones 6+, 6s+, 7+, 8+
        } else if (UIScreen.main.bounds.height > 668 && UIScreen.main.bounds.height < 737) {
            self.setupVariables(topPadding: 4,
                                bottomPadding: -4,
                                fontSize: 16)
        // and bigger Iphones
        } else if UIScreen.main.bounds.height > 737 {
            self.setupVariables(topPadding: 6,
                                bottomPadding: -6,
                                fontSize: 17)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    public func setupTitle(as name: String) {
        title.text = name
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Title
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Error" // Chow if not use setupTitle method
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        return label
    }()
    
    // Right Image
    private lazy var rightImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .red
        return image
    }()
    
    // Top Separator
    private lazy var topSeparator: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // Bottom Separator
    private lazy var bottomSeparator: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    // Constraints for Styles
    
    private func setupNormalStyleConstraints() {
        // Title
        title.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.left.equalTo(self.snp.left).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(bottomPadding)
        }
        
        // Right Image
        rightImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.right.equalTo(self.snp.right).offset(-5)
            make.bottom.equalTo(self.snp.bottom).offset(bottomPadding)
            make.height.equalTo(25) //Temp
            make.width.equalTo(25) //Temp
        }
    }
    
    // Constraints for Separators
    
    private func setupTopSeparatorConstraints() {
        // Top Separator
        topSeparator.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.width.equalToSuperview()
        }
    }
    
    private func setupBottomSeparatorConstraints() {
        // Bottom Separator
        bottomSeparator.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalToSuperview()
        }
    }

}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extensions

extension RowView {
    private func setupVariables(
        topPadding: CGFloat,
        bottomPadding: CGFloat,
        fontSize: CGFloat){
        
        self.topPadding = topPadding
        self.bottomPadding = bottomPadding
        self.fontSize = fontSize
    }
}
