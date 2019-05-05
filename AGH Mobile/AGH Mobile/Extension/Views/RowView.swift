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
    
    // Variables
    private var topPadding: CGFloat = 12
    private var bottomPadding: CGFloat = -12
    private var fontSize: CGFloat = 17
    // Constantly
    private let rightPadding: CGFloat = -2
    
    // Styles
    public enum Style {
        case normal
        case normalWithIndentation
        case withSwitch
        case imageOnTheLeft
        case empty
    }
    
    // Separator Positions
    public enum SeparatorPosition {
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
        case .normalWithIndentation: setupNormalWithIndentationStyle()
        case .withSwitch: setupWithSwitchStyle()
        case .imageOnTheLeft: setupImageOnTheLeftStyle()
        case .empty: setupEmptyStyle()
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
    
    // MARK: Setups for Styles
    
    private func setupNormalStyle() {
        self.addSubview(title)
        self.addSubview(rightImage)
        self.setupNormalStyleConstraints()
    }
    
    private func setupNormalWithIndentationStyle() {
        self.setupNormalStyle()
        self.updateNormalStyleConstraintsToNormalWithIndentation()
    }
    
    private func setupWithSwitchStyle() {
        self.addSubview(title)
        self.addSubview(castomSwitch)
        self.setupWithSwitchStyleConstraints()
    }
    
    private func setupImageOnTheLeftStyle() {
        self.addSubview(title)
        self.addSubview(leftImage)
        self.addSubview(rightImage)
        self.setupImageOnTheLeftStyleConstraints()
    }
    
    private func setupEmptyStyle() {
        self.addSubview(title)
        self.setupEmptyStyleConstraints()
    }
    
    // MARK: Setups for Separators
    
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
    // MARK: - Public Methods
    
    public func setupTitle(as name: String) {
        title.text = name
    }
    
    public func setupLeftImage(named name: String) {
        leftImage.image = UIImage(named: name)
    }
    
    public func addTapGestureRecognizer(_ target: Any?, action: Selector) {
        let gesture = UITapGestureRecognizer(target: target, action: action)
        gesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(gesture)
    }

    // MARK: Setups Variables Depend From Requirements
    
    // For Iphones 6, 6s, 7, 8
    public func setupVariablesForSmallResolution(
                customtopPadding: CGFloat,
                custombottomPadding: CGFloat,
                customfontSize: CGFloat) {
        if UIScreen.main.bounds.height < 668 {
            self.setupVariables(topPadding: customtopPadding,
                                bottomPadding: custombottomPadding,
                                fontSize: customfontSize)
        }
    }
    // For Iphones 6+, 6s+, 7+, 8+
    public func setupVariablesForMediumResolution(
        customtopPadding: CGFloat,
        custombottomPadding: CGFloat,
        customfontSize: CGFloat) {
        if (UIScreen.main.bounds.height > 668 && UIScreen.main.bounds.height < 737) {
            self.setupVariables(topPadding: customtopPadding,
                                bottomPadding: custombottomPadding,
                                fontSize: customfontSize)
        }
    }
    // For Iphones XS, XR, X, XS Max
    public func setupVariablesForHighResolution(
        customtopPadding: CGFloat,
        custombottomPadding: CGFloat,
        customfontSize: CGFloat) {
        if UIScreen.main.bounds.height > 737 {
            self.setupVariables(topPadding: customtopPadding,
                                bottomPadding: custombottomPadding,
                                fontSize: customfontSize)
        }
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
    
    // Left Image
    private lazy var leftImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .red
        return image
    }()
    
    // Switch
    private lazy var castomSwitch: UISwitch = {
        let Switch = UISwitch()
        Switch.onTintColor = .mainRed
        Switch.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.4481485445)
        Switch.translatesAutoresizingMaskIntoConstraints = false
        return Switch
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
    
    // MARK: Constraints for Styles
    
    private func setupNormalStyleConstraints() {
        // Title
        self.reusableTitleConstraints()
        // Right Image
        rightImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightPadding)
            make.height.equalTo(20) //Temp
            make.width.equalTo(20) //Temp
        }
    }
    
    private func updateNormalStyleConstraintsToNormalWithIndentation() {
        // Title
        title.snp.updateConstraints { (update) in
            update.left.equalTo(self.snp.left).offset(16)
        }
    }
    
    private func setupWithSwitchStyleConstraints() {
        // Title
        self.reusableTitleConstraints()
        // Switch
        castomSwitch.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightPadding)
        }
    }
    
    private func setupImageOnTheLeftStyleConstraints() {
        // Left Image
        leftImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left)
            make.height.equalTo(20) //Temp
            make.width.equalTo(20) //Temp
        }
        // Title
        title.snp.makeConstraints { (make) in
            make.left.equalTo(leftImage.snp.right).offset(8)
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.bottom.equalTo(self.snp.bottom).offset(bottomPadding)
        }
        // Right Image
        rightImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightPadding)
            make.height.equalTo(20) //Temp
            make.width.equalTo(20) //Temp
        }
    }
    
    private func setupEmptyStyleConstraints() {
        // Title
        self.reusableTitleConstraints()
    }
    
    // MARK: Constraints for Separators

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
    
    // MARK: Reusable Constraints
    
    private func reusableTitleConstraints() {
        // Title
        title.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.left.equalTo(self.snp.left)
            make.bottom.equalTo(self.snp.bottom).offset(bottomPadding)
        }
    }

}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Private Extension RowView

private extension RowView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Adjustment size to resolution
    
    private func adjustSizes() {
        // Iphones 6, 6s, 7, 8
        if UIScreen.main.bounds.height < 668 {
            self.setupVariables(topPadding: 11,
                                bottomPadding: -11,
                                fontSize: 15)
            // Iphones 6+, 6s+, 7+, 8+
        } else if (UIScreen.main.bounds.height > 668 && UIScreen.main.bounds.height < 737) {
            self.setupVariables(topPadding: 12,
                                bottomPadding: -12,
                                fontSize: 16.5)
            // and bigger Iphones
        } else if UIScreen.main.bounds.height > 737 {
            self.setupVariables(topPadding: 12,
                                bottomPadding: -12,
                                fontSize: 17)
        }
    }
    
    private func setupVariables(
        topPadding: CGFloat,
        bottomPadding: CGFloat,
        fontSize: CGFloat){
        
        self.topPadding = topPadding
        self.bottomPadding = bottomPadding
        self.fontSize = fontSize
    }
    
}
