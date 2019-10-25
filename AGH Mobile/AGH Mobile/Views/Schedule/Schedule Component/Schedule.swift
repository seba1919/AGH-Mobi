import Foundation
import UIKit

public class Schedule {
    public private(set) var items = [ScheduleItem]()
    
    public init(of subjects: [SubjectItem]) {
        self.items = getSchedule(of: subjects)
    }
    
    public var actionDelegate: ScheduleTapDelegate? {
        didSet {
            items.forEach({ item in
                if item is ScheduleKeyItem {
                    (item as! ScheduleKeyItem).actionDelegate = self.actionDelegate
                }
            })
        }
    }
    public var labelDelegate: ScheduleLabelDelegate? {
        didSet {
            items.forEach({ item in
                if item is ScheduleBreakItem {
                    let breakItem = (item as! ScheduleBreakItem)
                    breakItem.labelDelegate = labelDelegate
                }
            })
        }
    }
    
    private func getSchedule(of subjects: [SubjectItem]) -> [ScheduleItem] {
        guard !subjects.isEmpty else { return [] }
        let sortedSubjects = subjects.sorted(by: { $0.startDate < $1.startDate })

        var result = [ScheduleItem]()
        var current = [SubjectItem]()
        var previous: SubjectItem?
        
        for subject in sortedSubjects {
            if previous != nil {
                let timeDifference = subject.startDate.timeIntervalSince(previous!.endDate)
                if timeDifference >= 0 {
                    result.append(getNodeItem(current))
                    current.removeAll()
                    if timeDifference > 0 {
                        result.append(geteBreakItem(of: timeDifference))
                    }
                }
                if subject.endDate > previous!.endDate {
                    previous = subject
                }
            } else {
                previous = subject
            }
            current.append(subject)
        }
        result.append(getNodeItem(current))
        return result
    }
    
    private func getNodeItem(_ subjects: [SubjectItem]) -> ScheduleItem {
        var previous: SubjectItem?
        var nodeData = [ScheduleItemData]()
        let startTime = subjects.first!.startTime
        let endTime = subjects.reduce(subjects.first!, { $0.endDate > $1.endDate ? $0 : $1 }).endTime
        let timelineData = TimelineItemData(startTime: startTime, endTime: endTime)
        
        let shortestItemInterval: TimeInterval = subjects.reduce(Double.greatestFiniteMagnitude, {
            return min($0, $1.endDate.timeIntervalSince($1.startDate)) })
        
        let startDate = subjects.first!.startDate
        
        for subject in subjects {
            var offset: TimeInterval = 0
            var offsetFactor: CGFloat = 0
            
            if let previous = previous {
                let overlayInterval = subject.startDate.timeIntervalSince(previous.endDate)
                offset = overlayInterval
            }
            let currentInterval = subject.endDate.timeIntervalSince(subject.startDate)
            let heightFactor = CGFloat(currentInterval/shortestItemInterval)
            
            let placeUnderPrevious = offset >= 0 ? true : false
            
            if placeUnderPrevious {
                offsetFactor = CGFloat(offset/shortestItemInterval)
            } else {
                let offsetFromTop = subject.startDate.timeIntervalSince(startDate)
                offsetFactor = CGFloat(offsetFromTop/shortestItemInterval)
            }
            nodeData.append(
                ScheduleItemData(
                    id: subject.id,
                    offsetFactor: offsetFactor,
                    heightFactor: heightFactor,
                    title: subject.name,
                    leftItem: subject.classType,
                    rightItem: subject.location,
                    placeUnderPrevious: placeUnderPrevious
            ))
            previous = subject
        }
        return ScheduleKeyItem(frame: .zero, scheduleData: nodeData, timelineData: timelineData)
    }
    
    private func geteBreakItem(of timeDifference: TimeInterval) -> ScheduleItem {
        let data = BreakItemData(time: timeDifference)
        return ScheduleBreakItem(frame: .zero, data: data)
    }
}
