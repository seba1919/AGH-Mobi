import Foundation
import UIKit

class ScheduleKeyItem : ScheduleItem {
    override var backgroundBoxColor: UIColor? {
        didSet {
            leftView.backgroundBoxColor = backgroundBoxColor
            rightView.backgroundBoxColor = backgroundBoxColor
        }
    }
    override var keyColor: UIColor? {
        didSet {
            leftView.keyColor = keyColor
            rightView.keyColor = keyColor
        }
    }
    override var textColor: UIColor? {
        didSet {
            leftView.textColor = textColor
            rightView.textColor = textColor
        }
    }
    
    private var data: [ScheduleItemData] = []
    lazy var leftView = TimelineKeyItem()
    private var rightView = KeyItem(frame: .zero, numberOfItems: 0)
    
    public var actionDelegate: ScheduleTapDelegate? {
        didSet {
            rightView.actionDelegate = self.actionDelegate
        }
    }
    lazy var mainLabel = UILabel()
    
    init(frame: CGRect, data: [ScheduleItemData]) {
        super.init(frame: frame)
        self.leftView = TimelineKeyItem()
        self.colorize(item: self.leftView)
        
        self.rightView = KeyItem(frame: self.frame, data: data)
        self.colorize(item: self.rightView)
        self.setupActions()
        self.setupView(leftItem: self.leftView, rightItem: self.rightView)
    }
    
    init(frame: CGRect, scheduleData: [ScheduleItemData], timelineData: TimelineItemData) {
        super.init(frame: frame)
        self.leftView = TimelineKeyItem(frame: self.frame, data: timelineData)
        self.colorize(item: self.leftView)
        
        self.rightView = KeyItem(frame: self.frame, data: scheduleData)
        self.colorize(item: self.rightView)
        self.setupActions()
        self.setupView(leftItem: self.leftView, rightItem: self.rightView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView(leftItem: self.leftView, rightItem: self.rightView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    public func setStartTime(to time: String) {
        self.leftView.setStartTime(to: time)
    }
    
    public func setEndTime(to time: String) {
        self.leftView.setEndTime(to: time)
    }
    
    public func setupData(data: [ScheduleItemData]) {
        self.data = data
        self.leftView = TimelineKeyItem()
        self.colorize(item: self.leftView)
        
        self.rightView = KeyItem(frame: self.frame, data: data)
        self.colorize(item: self.rightView)
    }
    
    private func colorize(item: Colorable) {
        item.keyColor = keyColor
        item.backgroundBoxColor = backgroundBoxColor
        item.textColor = textColor
    }
    
    public func setupColors() {
        self.leftView.keyColor = keyColor
        self.rightView.keyColor = keyColor
        self.rightView.backgroundBoxColor = backgroundBoxColor
        self.rightView.textColor = textColor
    }
    
    public func setupActions() {
        self.rightView.actionDelegate = actionDelegate
    }
}
