//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

final class RowView: UIView {
    
    // MARK: - Private properties
    private var topPadding: CGFloat = 12
    private var bottomPadding: CGFloat = -12
    private var fontSize: CGFloat = 17
    
    private let rightPadding: CGFloat = -5
    private let leftMargin: CGFloat = 20
    private let rightMargin: CGFloat = -20

    private var touchDetectStatus: TouchDetect?
    
    private lazy var touchGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(onTouchAnimateRowAndDoAction(_:)))
        gesture.minimumPressDuration = 0.0
        return gesture
    }()
    
    // MARK: - Public properties
    public var setAction: (() -> Void)?
    
    // MARK: - Public enums
    /// Styles
    public enum Style {
        case normal
        case normalWithIndentation
        case withSwitch
        case withLeftAccessory
        case empty
    }
    /// Separator Positions
    public enum SeparatorPosition {
        case top
        case bottom
        case topAndBottom
    }
    /// Touch Detect
    public enum TouchDetect {
        case enabled
        case enabledWithAnimationDisabled
        case disabled
    }
    
    // MARK: - Components of View
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Title is not set" // Show if not use setupTitle method
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        return label
    }()
    
    private lazy var rightAccessory: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow_right")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var leftAccessory: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var castomSwitch: UISwitch = {
        let castomSwitch = UISwitch()
        castomSwitch.onTintColor = .mainRed
        castomSwitch.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.4481485445)
        castomSwitch.translatesAutoresizingMaskIntoConstraints = false
        return castomSwitch
    }()
    
    private lazy var topSeparator: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    private lazy var bottomSeparator: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // MARK: - Init
    required init(style: Style = .normal,
                  separatorPosition: SeparatorPosition = .top,
                  touchDetect: TouchDetect = .enabled) {
        
        super.init(frame: CGRect.zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        adjustSizes()
        touchDetectStatus = touchDetect
        
        // Style
        switch style {
        case .normal:
            setupNormalStyle()
        case .normalWithIndentation:
            setupNormalWithIndentationStyle()
        case .withSwitch:
            setupWithSwitchStyle()
            touchDetectStatus = .disabled
        case .withLeftAccessory:
            setupWithLeftAccessoryStyle()
        case .empty:
            setupEmptyStyle()
        }
        
        // Separator Position
        switch separatorPosition {
        case .top:
            setupTopSeparator()
        case .bottom:
            setupBottomSeparator()
        case .topAndBottom:
            setupTopAndBottomSeparators()
        }
        
        // Touch Detect
        if !(touchDetectStatus == .disabled) {
            self.addTouchGestureRecognizer()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RowView {
    
    // MARK: - Setups
    /// Setups for Styles
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
    
    /// Setups for Separators
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
    
    // MARK: - Constraints
    /// Constraints for Styles
    private func setupNormalStyleConstraints() {
        self.reusableTitleConstraints()
        rightAccessory.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightMargin + rightPadding)
        }
    }
    
    private func updateNormalStyleConstraintsToNormalWithIndentation() {
        title.snp.updateConstraints { (update) in
            update.left.equalTo(self.snp.left).offset(leftMargin + 16)
        }
    }
    
    private func setupWithSwitchStyleConstraints() {
        self.reusableTitleConstraints()
        castomSwitch.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightMargin + rightPadding)
        }
    }
    
    private func setupWithLeftAccessoryStyleConstraints() {
        leftAccessory.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left).offset(leftMargin)
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        title.snp.makeConstraints { (make) in
            make.left.equalTo(leftAccessory.snp.right).offset(12)
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.bottom.equalTo(self.snp.bottom).offset(bottomPadding)
        }
        rightAccessory.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(rightMargin + rightPadding)
        }
    }
    
    private func setupEmptyStyleConstraints() {
        self.reusableTitleConstraints()
    }
    
    /// Constraints for Separators
    private func setupTopSeparatorConstraints() {
        topSeparator.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left).offset(leftMargin)
            make.right.equalTo(self.snp.right).offset(rightMargin)
        }
    }
    
    private func setupBottomSeparatorConstraints() {
        bottomSeparator.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(leftMargin)
            make.right.equalTo(self.snp.right).offset(rightMargin)
        }
    }
    
    // MARK: Reusable Constraints
    private func reusableTitleConstraints() {
        title.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.left.equalTo(self.snp.left).offset(leftMargin)
            make.bottom.equalTo(self.snp.bottom).offset(bottomPadding)
        }
    }
    
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
            if !(touchDetectStatus == .enabledWithAnimationDisabled) {
                self.animateRowBackgroundColor(to: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.6677279538))
            }
        case .ended:
            self.animateRowBackgroundColor(to: .white)
            self.setAction?()
        case .changed:
            if !self.bounds.contains(positionOfTouch) {
                sender.state = .cancelled
            }
        case .cancelled:
            self.animateRowBackgroundColor(to: .white)
        default: print("err...?")
        }
    }
    
    // MARK: - Adjustment size to resolution
    private func adjustSizes() {        
        if UIScreen.isSmallSize() {
            self.setupVariables(topPadding: 10,
                                bottomPadding: -10,
                                fontSize: 13)
        } else if UIScreen.isMediumSize() {
            self.setupVariables(topPadding: 11,
                                bottomPadding: -11,
                                fontSize: 15)
        } else if UIScreen.isLargeSize() {
            self.setupVariables(topPadding: 12,
                                bottomPadding: -12,
                                fontSize: 16.5)
            
        } else if UIScreen.isBigSize() {
            self.setupVariables(topPadding: 12,
                                bottomPadding: -12,
                                fontSize: 17)
        }
    }
    
    private func setupVariables(
        topPadding: CGFloat,
        bottomPadding: CGFloat,
        fontSize: CGFloat) {
        
        self.topPadding = topPadding
        self.bottomPadding = bottomPadding
        self.fontSize = fontSize
    }
}

extension RowView {
    
    // MARK: - Public Methods
    public func setupTitle(as name: String) {
        title.text = name
    }
    
    public func setupLeftAccessory(named name: String) {
        leftAccessory.image = UIImage(named: name)
    }
}
