import Foundation
import UIKit

public class TimelineItemData {
    private(set) var startTime: String
    private(set) var endTime: String
    
    public init(startTime: String = "", endTime: String = "") {
        self.startTime = startTime
        self.endTime = endTime
    }
    
    public func setStartTime(to time: String = "") {
        self.startTime = time
    }
    
    public func setEndTime(to time: String = "") {
        self.endTime = time
    }
}
