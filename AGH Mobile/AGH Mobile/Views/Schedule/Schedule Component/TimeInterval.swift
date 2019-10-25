import Foundation

public extension TimeInterval {
    var seconds: Double { return self }
    var minutes: Double { return self/60 }
    var hours: Double { return self/3600 }
    var days: Double { return self/86400 }
    var years: Double { return self/31536000 }
}
