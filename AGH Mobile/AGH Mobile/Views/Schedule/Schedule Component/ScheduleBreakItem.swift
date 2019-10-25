import Foundation
import UIKit

public protocol ScheduleBreakLabelDelegate: class {
    func getBreakLabel(time: TimeInterval) -> String
}

public class ScheduleBreakItem: ScheduleItem, Colorable {
    override public var backgroundBoxColor: UIColor? {
        didSet {
            leftView.backgroundBoxColor = backgroundBoxColor
            rightView.backgroundBoxColor = backgroundBoxColor
        }
    }
    override public var keyColor: UIColor? {
        didSet {
            leftView.keyColor = keyColor
            rightView.keyColor = keyColor
        }
    }
    override public var textColor: UIColor? {
        didSet {
            leftView.textColor = textColor
            rightView.textColor = textColor
        }
    }
    
    lazy var leftView = TimelineBreakItem()
    lazy var rightView = InfoMessage()
    
    lazy var mainLabel = UILabel()
    
    public var breakItemData: BreakItemData?
    
    public var labelDelegate: ScheduleBreakLabelDelegate? {
        didSet {
            guard let breakInterval = breakItemData?.time else { return }
            let newLabel = labelDelegate?.getBreakLabel(time: breakInterval) ?? ""
            self.setTitleLabel(to: newLabel)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView(leftItem: self.leftView, rightItem: self.rightView)
    }
    
    public init(frame: CGRect, data: BreakItemData) {
        super.init(frame: frame)
        self.setupView(leftItem: self.leftView, rightItem: self.rightView)
        self.breakItemData = data
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func setupConstraints() {
        super.setupConstraints()
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    public func setTitleLabel(to titleLabel: String) {
        self.rightView.setTitleLabel(to: titleLabel)
    }
}
