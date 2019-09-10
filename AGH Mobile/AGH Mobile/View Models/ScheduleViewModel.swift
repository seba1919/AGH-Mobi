//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

final class ScheduleViewModel {
    
    private static var scheduleProvider: ScheduleProvider?
    
    static func setFaculty(faculty: Faculty) {
        if scheduleProvider != nil {
            fatalError("Double call setFaculty()")
        }
        
        switch faculty {
        case .WEAIiIBfaculty:
            scheduleProvider = EAIIBScheduleImpl()
        case .WIEiTfaculty:
            scheduleProvider = IETScheduleImpl()
        case .WFiISfaculty:
            scheduleProvider = UniTimeScheduleImpl()
        default:
            scheduleProvider = WDViewModel.model
        }
    }
    
    public static func getScheduleForDays(amount: Int) -> [DaySchedule] {
        return scheduleProvider!.getScheduleForDays(amount: amount)
    }
}
