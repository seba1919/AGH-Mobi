import Foundation
import UIKit

public class TimelineBreakItem: Timeline {
    
    private let dashLength: NSNumber = 7
    private let dashGap: NSNumber = 5
    
    override public var keyColor: UIColor? {
        get {
            return UIColor(cgColor: line.fillColor ?? Timeline.defaultKeyColor)
        }
        set {
            line.strokeColor = newValue?.cgColor
        }
    }
    
    override public func updatePath() {
        line.lineWidth = self.lineWidth
        line.lineDashPattern = [dashLength, dashGap]
        
        let linePath = CGMutablePath()
        linePath.addLines(between: [CGPoint(x: self.frame.width-rightOffset, y: 0), CGPoint(x: self.frame.width-rightOffset, y: self.frame.height)])
        line.path = linePath
    }
}
