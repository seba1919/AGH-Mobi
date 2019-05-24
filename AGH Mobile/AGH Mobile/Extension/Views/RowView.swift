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
    
    // View
    private var topPadding: CGFloat = 12
    private var bottomPadding: CGFloat = -12
    private var fontSize: CGFloat = 17
    
    private let rightPadding: CGFloat = -5
    private let leftMargin: CGFloat = 20
    private let rightMargin: CGFloat = -20
    
    // Gesture
    private lazy var touchGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(onTouchAnimateRowAndDoAction(_:)))
        gesture.minimumPressDuration = 0.0
        gesture.cancelsTouchesInView = false
        gesture.delegate = self
        return gesture
    }()
    
    // Set Action
    public var setAction: (() -> Void)?
    
    // Styles
    public enum Style {
        case normal
        case normalWithIndentation
        case withSwitch
        case withLeftAccessory
        case empty
    }
    
    // Separator Positions
    public enum SeparatorPosition {
        case top
        case bottom
        case topAndBottom
    }
    
    // Touch Detect
    public enum TouchDetect {
        case on
        case onWithAnimationOff
        case off
    }
    private var touchDetectStatus: TouchDetect?
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init

    required init(style: Style = .normal, separatorPosition: SeparatorPosition = .top, touchDetect: TouchDetect = .on){
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustSizes()
        self.touchDetectStatus = touchDetect
        
        // Style
        switch style {
        case .normal: setupNormalStyle()
        case .normalWithIndentation: setupNormalWithIndentationStyle()
        case .withSwitch: setupWithSwitchStyle()
                          touchDetectStatus = .off
        case .withLeftAccessory: setupWithLeftAccessoryStyle()
        case .empty: setupEmptyStyle()
        }
        
        // Separator Position
        switch separatorPosition {
        case .top: setupTopSeparator()
        case .bottom: setupBottomSeparator()
        case .topAndBottom: setupTopAndBottomSeparators()
        }
        
        // Touch Detect
        if !(touchDetectStatus == .off) {
            self.addTouchGestureRecognizer()
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
        self.addSubview(rightAccessory)
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
    
    private func setupWithLeftAccessoryStyle() {
        self.addSubview(title)
        self.addSubview(leftAccessory)
        self.addSubview(rightAccessory)
        self.setupWithLeftAccessoryStyleConstraints()
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
    
    public func setupLeftAccessory(named name: String) {
        leftAccessory.image = UIImage(named: name)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Title
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Title is not set" // Show if not use setupTitle method
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        return label
    }()
    
    // Right Accessory
    private lazy var rightAccessory: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow_right")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Left Accessory
    private lazy var leftAccessory: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
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
        // Right Accessory
        rightAccessory.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightMargin + rightPadding)
        }
    }
    
    private func updateNormalStyleConstraintsToNormalWithIndentation() {
        // Title
        title.snp.updateConstraints { (update) in
            update.left.equalTo(self.snp.left).offset(leftMargin + 16)
        }
    }
    
    private func setupWithSwitchStyleConstraints() {
        // Title
        self.reusableTitleConstraints()
        // Switch
        castomSwitch.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightMargin + rightPadding)
        }
    }
    
    private func setupWithLeftAccessoryStyleConstraints() {
        // Left Accessory
        leftAccessory.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left).offset(leftMargin)
        }
        // Title
        title.snp.makeConstraints { (make) in
            make.left.equalTo(leftAccessory.snp.right).offset(12)
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.bottom.equalTo(self.snp.bottom).offset(bottomPadding)
        }
        // Right Accessory
        rightAccessory.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightMargin + rightPadding)
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
            make.left.equalTo(self.snp.left).offset(leftMargin)
            make.right.equalTo(self.snp.right).offset(rightMargin)
        }
    }
    
    private func setupBottomSeparatorConstraints() {
        // Bottom Separator
        bottomSeparator.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(leftMargin)
            make.right.equalTo(self.snp.right).offset(rightMargin)
        }
    }
    
    // MARK: Reusable Constraints
    
    private func reusableTitleConstraints() {
        // Title
        title.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.left.equalTo(self.snp.left).offset(leftMargin)
            make.bottom.equalTo(self.snp.bottom).offset(bottomPadding)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Animations and Gestures
    
    private func addTouchGestureRecognizer() {
        self.addGestureRecognizer(touchGesture)
    }
    
    private func animateRowBackgroundColor(to color: UIColor) {
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = color
        }
    }
    
    @objc private func onTouchAnimateRowAndDoAction(_ sender: UILongPressGestureRecognizer) {
        
        let positionOfTouch = sender.location(in: self)
        
        switch sender.state {
        case .began:
            if !(touchDetectStatus == .onWithAnimationOff) {
                self.animateRowBackgroundColor(to: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.6677279538))
            }
        case .ended:
            self.animateRowBackgroundColor(to: .white)
            self.setAction?()
        case .changed:
            if (!self.bounds.contains(positionOfTouch)) {
                sender.state = .cancelled
            }
        case .cancelled:
            self.animateRowBackgroundColor(to: .white)
        default: print("err...?")
        }
    }

}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Private Extension RowView

private extension RowView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Adjustment size to resolution
    
    private func adjustSizes() {
        let screenHeight = UIScreen.main.bounds.height
        
        // Iphones SE, 5s and other small things
        if (screenHeight < 569) {
            self.setupVariables(topPadding: 10,
                                bottomPadding: -10,
                                fontSize: 13)
        // Iphones 6, 6s, 7, 8
        } else if (screenHeight > 569 && screenHeight < 668) {
            self.setupVariables(topPadding: 11,
                                bottomPadding: -11,
                                fontSize: 15)
        // Iphones 6+, 6s+, 7+, 8+
        } else if (screenHeight > 668 && screenHeight < 737) {
            self.setupVariables(topPadding: 12,
                                bottomPadding: -12,
                                fontSize: 16.5)
        // and bigger Iphones
        } else if screenHeight > 737 {
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

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extension of Should Recognize With

extension RowView: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
