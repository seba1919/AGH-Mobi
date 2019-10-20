//
//  WDSubpageURLType.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 20/10/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation
/// Containts key parts of URLs for Wirtualny Dziekanat subpages
enum WDSubpageURLType: String {
    case news = "Ogloszenia"
    case gradesECTSPoints = "OcenyP"
    case scholarship = "Stypendia"
    case thesis = "PracaDyp"
    case schedule = "PodzGodz"
    static func defaultSubpage() -> WDSubpageURLType {
        return news
    }
}
