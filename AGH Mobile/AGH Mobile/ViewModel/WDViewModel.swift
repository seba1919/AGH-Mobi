//
//  WD.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 09/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

final class WDViewModel {
    internal static var model: ModelWD = TestWDImpl()
    
    public static func getGrades() -> Grades {
        return model.getGrades()
    }
    
    public static func getPersonalInfo() -> PersonalInfo {
        return model.getPersonalInfo()
    }
    
    public static func getScholarshipInfo() -> ScholarshipInfo {
        return model.getScholarshipInfo()
    }
    
    public static func getStudyProgress() -> [StudyProgress] {
        return model.getStudyProgress()
    }
}
