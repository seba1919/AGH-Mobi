//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

struct Grades {
    
    public var courses: [Course]
    public var avgSem: Double?
    public var avgYear: Double?
    
    public func getEcts() -> Int {
        return courses.reduce(0, {
            if $1.finalGrade >= 3.0 {
                return $0 + $1.ects
            }
            return $0
        })
    }
    
    public func getMaxEcts() -> Int {
        return courses.reduce(0, { $0 + $1.ects })
    }
}
