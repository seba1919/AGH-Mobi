//
//  Model.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 09/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

protocol ModelWD {
    func getGrades() -> Grades
    
    func getPersonalInfo() -> PersonalInfo
    
    func getScheduleForDays(daysCount : Int) -> [DaySchedule]
    
    //func getPicture() ->
}
