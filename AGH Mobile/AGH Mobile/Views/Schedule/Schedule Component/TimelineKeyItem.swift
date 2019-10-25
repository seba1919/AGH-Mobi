import Foundation
import UIKit

public class TimelineKeyItem : Timeline {
    
    lazy var startTime = UILabel()
    lazy var endTime = UILabel()
    lazy var circle = CAShapeLayer()
    
    override public var backgroundBoxColor: UIColor? {
        get {
            return super.backgroundBoxColor
        }
        set {
            super.backgroundBoxColor = newValue
            backgroundColor = newValue
            line.backgroundColor = newValue?.cgColor
            circle.fillColor = newValue?.cgColor
        }
    }
    override public var keyColor: UIColor? {
        get {
            return UIColor(cgColor: line.strokeColor ?? Timeline.defaultKeyColor)
        }
        set {
            startTime.textColor = newValue
            endTime.textColor = newValue
            circle.strokeColor = newValue?.cgColor
            line.strokeColor = newValue?.cgColor
        }
    }

    var circleRadius: CGFloat = 8.0
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLabels()
    }
    
    public init(frame: CGRect, data: TimelineItemData) {
        super.init(frame: frame)
        self.setupLabels()
        self.setStartTime(to: data.startTime)
        self.setEndTime(to: data.endTime)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func configure() {
        super.configure()
        
        circle.fillColor = backgroundBoxColor?.cgColor
        circle.strokeColor = self.keyColor?.cgColor
        layer.addSublayer(circle)
    }
    
    private func setupLabels() {
        self.startTime.textColor = self.keyColor
        self.startTime.textAlignment = .left
        self.startTime.font = UIFont.systemFont(ofSize: self.fontSize, weight: UIFont.Weight.medium)
        self.addSubview(self.startTime)
        
        self.endTime.textColor = self.keyColor
        self.endTime.textAlignment = .left
        self.endTime.font = UIFont.systemFont(ofSize: self.fontSize, weight: UIFont.Weight.medium)
        self.addSubview(self.endTime)
    }
    
    private func layoutLabels() {
        self.startTime.frame = CGRect(x: 0, y: self.topOffset-self.circleRadius, width: self.frame.width-rightOffset-circleRadius, height: self.fontSize)
        
        self.endTime.frame = CGRect(x: 0, y: self.topOffset+self.fontSize, width: self.frame.width-rightOffset-circleRadius, height: self.fontSize)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.updatePath()
        self.layoutLabels()
    }
    
    override public func updatePath() {
        super.updatePath()
        
        let circlePosition = CGPoint(x: self.frame.width-rightOffset, y: topOffset)
        circle.lineWidth = self.lineWidth
        circle.path = UIBezierPath(ovalIn: CGRect(x: circlePosition.x-circleRadius, y: circlePosition.y-circleRadius, width: circleRadius*2, height: circleRadius*2)).cgPath
    }
    
    public func setStartTime(to startTime: String) {
        self.startTime.text = startTime
    }
    
    public func setEndTime(to endTime: String) {
        self.endTime.text = endTime
    }
}
