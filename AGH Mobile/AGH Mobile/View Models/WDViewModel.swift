//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

final class WDViewModel {
    
    static var model: ModelWD = TestWDImpl()
    
    static func getGrades() -> Grades {
        return model.getGrades()
    }
    
    static func getPersonalInfo() -> PersonalInfo {
        return model.getPersonalInfo()
    }
    
    static func getScholarshipInfo() -> ScholarshipInfo {
        return model.getScholarshipInfo()
    }
    
    static func getStudyProgress() -> [StudyProgress] {
        return model.getStudyProgress()
    }
}
