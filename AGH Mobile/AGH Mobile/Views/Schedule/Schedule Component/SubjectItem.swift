import Foundation

public struct SubjectItem {
    public let id: Int
    public let name: String
    public let classType: String
    public let location: String
    public let startDate: Date
    public let endDate: Date
    public var startTime: String { return getTime(of: startDate) }
    public var endTime: String { return getTime(of: endDate) }
    
    public init(id: Int, name: String, classType: String, location: String, startDate: String, endDate: String) {
        self.id = id
        self.name = name
        self.classType = classType
        self.location = location
        self.startDate = SubjectItem.convertDate(from: startDate)
        self.endDate = SubjectItem.convertDate(from: endDate)
    }
    
    static public func convertDate(from date: String) -> Date {
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return RFC3339DateFormatter.date(from: date)!
    }
    
    private func getTime(of date: Date) -> String {
        let hours = date.hour
        let minutes = date.minute
        return "\(hours < 10 ? "0\(hours)" : "\(hours)"):\(minutes < 10 ? "0\(minutes)" : "\(minutes)")"
    }
}
