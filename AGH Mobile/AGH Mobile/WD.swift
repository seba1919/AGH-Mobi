//
//  WD.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 09/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

final class WD {
    private static var model = TestModel()
    public static func getGrades() -> Grades {
        return model.getGrades()
    }
}
