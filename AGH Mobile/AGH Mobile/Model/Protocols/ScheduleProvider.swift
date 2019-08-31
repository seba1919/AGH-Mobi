//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

protocol ScheduleProvider {
    
    func getScheduleForDays(amount: Int) -> [DaySchedule]
}
