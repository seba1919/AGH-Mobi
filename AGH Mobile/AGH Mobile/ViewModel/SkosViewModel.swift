//
//  Skos.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 15/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

final class SkosViewModel {
    private static var model = TestSkosImpl()
    
    public static func getSkos() -> [Employee] {
        return model.getSkos()
    }
}
