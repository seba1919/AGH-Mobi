import Foundation
import UIKit

public class Timeline: UIView, Colorable {
    static let defaultKeyColor: CGColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1)
    static let defaultBackgroundBoxColor: CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    lazy var line = CAShapeLayer()
    
    public var keyColor: UIColor? {
        get {
            return UIColor(cgColor: line.strokeColor ?? Timeline.defaultKeyColor)
        }
        set {
            line.strokeColor = newValue?.cgColor
        }
    }
    public var backgroundBoxColor: UIColor? {
        get {
            return backgroundColor
        }
        set {
            backgroundColor = newValue
            line.backgroundColor = newValue?.cgColor
        }
    }
    
    var fontSize: CGFloat = 15
    var rightOffset: CGFloat = 15
    var topOffset: CGFloat = 25
    var lineWidth: CGFloat = 3.0
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        isOpaque = false
        keyColor = UIColor(cgColor: Timeline.defaultKeyColor)
        backgroundBoxColor = UIColor(cgColor: Timeline.defaultBackgroundBoxColor)
        layer.addSublayer(line)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.updatePath()
    }
    
    public func updatePath() {
        line.frame = self.bounds
        let linePath = UIBezierPath()
        
        linePath.move(to: CGPoint(x: self.frame.width-rightOffset, y: 0))
        linePath.addLine(to: CGPoint(x: self.frame.width-rightOffset, y: self.frame.height))
        line.lineWidth = self.lineWidth
        line.path = linePath.cgPath
    }
}
