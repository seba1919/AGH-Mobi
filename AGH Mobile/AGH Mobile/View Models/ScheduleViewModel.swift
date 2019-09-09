//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

final class ScheduleViewModel {
    
    private static var scheduleProvider: ScheduleProvider?
    
    static func setFaculty(faculty: Faculty) {
        if scheduleProvider != nil {
            fatalError("Double call setFaculty()")
        }
        
        switch faculty {
        case .ElectricalEngineeringAutomaticsComputerScienceAndBiomedicalEngineering:
            scheduleProvider = EAIIBScheduleImpl()
        case .ComputerScienceElectronicsAndTelecommunications:
            scheduleProvider = IETScheduleImpl()
        case .PhysicsAndAppliedComputerScience:
            scheduleProvider = UniTimeScheduleImpl()
        default:
            scheduleProvider = WDViewModel.model
        }
    }
    
    public static func getScheduleForDays(amount: Int) -> [DaySchedule] {
        return scheduleProvider!.getScheduleForDays(amount: amount)
    }
}
