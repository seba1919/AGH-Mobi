//
//  WDURLGenerator.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 20/10/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation
import Alamofire

/// Gathers logic of preparing request for Wirtualny Dziekant,
/// which comes from old ASP.NET architecture (that WD is based on).
class WDRequestComponentsGenerator {
    static func getLoginURL(withWDSubpageURLType subpageType: WDSubpageURLType) -> URL {
        return URL(string:
            "https://dziekanat.agh.edu.pl/Logowanie2.aspx?ReturnUrl=%2f" +
            subpageType.rawValue +
            ".aspx")!
    }
    
    static func getURLToSubpage(with subpageType: WDSubpageURLType) -> URL {
        return URL(string: "https://dziekanat.agh.edu.pl/" +
            subpageType.rawValue +
            ".aspx")!
    }
    
    static func getHTTPHeaders() -> HTTPHeaders? {
        return [ "Content-Type": "application/x-www-form-urlencoded" ]
    }
    
    static func getParameters(withViewState viewState: String,
                              withViewGenerator viewGenerator: String,
                              withUserLogin userLogin: String,
                              withUserPassword userPassword: String,
                              withEventValidation eventValidation: String) -> Parameters {
        return [
            "__VIEWSTATE": viewState,
            "__VIEWSTATEGENERATOR": viewGenerator,
            "ctl00$ctl00$ContentPlaceHolder$MiddleContentPlaceHolder$txtIdent": userLogin,
            "ctl00$ctl00$ContentPlaceHolder$MiddleContentPlaceHolder$txtHaslo": userPassword,
            "ctl00$ctl00$ContentPlaceHolder$MiddleContentPlaceHolder$butLoguj": "Zaloguj",
            "ctl00$ctl00$ContentPlaceHolder$MiddleContentPlaceHolder$rbKto": "student",
            "__EVENTVALIDATION": eventValidation
        ]
    }
    
    static func getLogoutURL() -> URL {
        return URL(string: "https://dziekanat.agh.edu.pl/Wyloguj.aspx")!
    }
}
