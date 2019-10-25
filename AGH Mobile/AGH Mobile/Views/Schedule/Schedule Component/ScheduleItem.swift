import Foundation
import UIKit

public protocol Colorable: class {
    var backgroundBoxColor: UIColor? { get set }
    var keyColor: UIColor? { get set }
    var textColor: UIColor? { get set }
}

public extension Colorable {
    var backgroundBoxColor: UIColor? {
        get { return nil }
        set { }
    }
    var keyColor: UIColor? {
        get { return nil }
        set { }
    }
    var textColor: UIColor? {
        get { return nil}
        set { }
    }
}

public class ScheduleItem: UIStackView {
    public typealias ScheduleSubview =  UIView & Colorable
    public static let defaultBackgroundBoxColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    public static let defaultKeyColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1)
    public static let defaultTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    public var backgroundBoxColor: UIColor? {
        didSet {
            for (left, right) in items {
                left.backgroundBoxColor = self.backgroundBoxColor
                right.backgroundBoxColor = self.backgroundBoxColor
            }
        }
    }
    public var keyColor: UIColor? {
        didSet {
            for (left, right) in items {
                left.keyColor = self.keyColor
                right.keyColor = self.keyColor
            }
        }
    }
    public var textColor: UIColor? {
        didSet {
            for (left, right) in items {
                left.textColor = self.textColor
                right.textColor = self.textColor
            }
        }
    }
    private var items = [(ScheduleSubview, ScheduleSubview)]()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupComponent()
        self.setupStackView()
        self.setupConstraints()
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func setupComponent() {
        self.backgroundBoxColor = ScheduleItem.defaultBackgroundBoxColor
        self.keyColor = ScheduleItem.defaultKeyColor
        self.textColor = ScheduleItem.defaultTextColor
    }
    
    public func setupStackView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 0
        self.distribution = .fill
    }
    
    public func setupView(leftItem: ScheduleSubview, rightItem: ScheduleSubview) {
        self.setupLeftItem(leftItem)
        self.setupRightItem(rightItem)
        items.append((leftItem, rightItem))
    }
    
    private func setupLeftItem(_ leftItem: ScheduleSubview) {
        self.addArrangedSubview(leftItem)
        leftItem.backgroundBoxColor = backgroundBoxColor
        leftItem.keyColor = keyColor
        leftItem.textColor = textColor
        leftItem.translatesAutoresizingMaskIntoConstraints = false
        leftItem.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func setupRightItem(_ rightItem: ScheduleSubview) {
        rightItem.backgroundBoxColor = backgroundBoxColor
        rightItem.keyColor = keyColor
        rightItem.textColor = textColor
        self.addArrangedSubview(rightItem)
    }
}
