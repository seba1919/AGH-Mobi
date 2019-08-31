//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

final class ScheduleViewModel {
    
    private static var scheduleProvider: ScheduleProvider?
    
    static func setFaculty(faculty: Faculty) {
        if scheduleProvider != nil {
            fatalError("Double call setFaculty()")
        }
        
        switch faculty {
        case .facultyOfEAIiIB:
            scheduleProvider = EAIIBScheduleImpl()
        case .facultyOfIEiT:
            scheduleProvider = IETScheduleImpl()
        case .facultyOfFiIS:
            scheduleProvider = UniTimeScheduleImpl()
        default:
            scheduleProvider = WDViewModel.model
        }
    }
    
    public static func getScheduleForDays(amount: Int) -> [DaySchedule] {
        return scheduleProvider!.getScheduleForDays(amount: amount)
    }
}
