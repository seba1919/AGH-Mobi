//
//  String.swift
//  AGH Mobile
//
//  Created by Bartłomiej Pluta on 15/10/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ arguments: CVarArg...) -> String {
        return String(format: localized, locale: .current, arguments: arguments)
    }
}
