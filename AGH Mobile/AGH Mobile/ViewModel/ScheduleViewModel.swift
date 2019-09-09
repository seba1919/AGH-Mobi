//
//  ScheduleViewModel.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 02/07/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

final class ScheduleViewModel {
    private static var scheduleProvider : ScheduleProvider?
    
    internal static func setFaculty(faculty: Faculty) {
        if (scheduleProvider != nil) {
            fatalError("Double call setFaculty()")
        }
        
        switch faculty {
        case .ElectricalEngineeringAutomaticsComputerScienceAndBiomedicalEngineering:
            scheduleProvider = EAIIBScheduleImpl()
        case .ComputerScienceElectronicsAndTelecommunications:
            scheduleProvider = IETScheduleImpl()
        case .PhysicsAndAppliedComputerScience:
            scheduleProvider = UniTimeScheduleImpl()
            break
        default: // dla pozostalych wydzialow bierzemy plan z WD
            scheduleProvider = WDViewModel.model
            break
        }
    }
    
    public static func getScheduleForDays(amount: Int) -> [DaySchedule] {
        return scheduleProvider!.getScheduleForDays(amount: amount)
    }
}
