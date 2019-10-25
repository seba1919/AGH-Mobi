import Foundation
import UIKit

public class ScheduleItemData {
    private(set) var identifier: Int?
    private(set) var offsetFactor: CGFloat
    private(set) var heightFactor: CGFloat
    private(set) var placeUnderPrevious: Bool
    private(set) var title: String
    private(set) var leftItem: String
    private(set) var rightItem: String
    
    public init(id: Int? = nil, offsetFactor: CGFloat = 0, heightFactor: CGFloat, title: String = "", leftItem: String = "", rightItem: String = "", placeUnderPrevious: Bool = false) {
        self.identifier = id
        self.offsetFactor = offsetFactor
        self.heightFactor = heightFactor
        self.title = title
        self.leftItem = leftItem
        self.rightItem = rightItem
        self.placeUnderPrevious = placeUnderPrevious
    }
    
    public func setOffsetFactor(to offsetFactor: CGFloat = 0) {
        self.offsetFactor = offsetFactor
    }
    
    public func setHeightFactor(to heightFactor: CGFloat = 0) {
        self.heightFactor = heightFactor
    }
    
    public func setTitle(to title: String = "") {
        self.title = title
    }
    
    public func setLeftItem(to leftItem: String = "") {
        self.leftItem = leftItem
    }
    
    public func setRightItem(to rightItem: String = "") {
        self.rightItem = rightItem
    }
}
